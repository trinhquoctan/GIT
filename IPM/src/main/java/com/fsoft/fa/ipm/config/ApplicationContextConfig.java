package com.fsoft.fa.ipm.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;
import java.util.logging.Logger;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.fsoft.fa.ipm")
@PropertySource("classpath:config.properties")
public class ApplicationContextConfig extends WebMvcConfigurerAdapter{
    
    @Autowired
    Environment env;
    
    private Logger logger = Logger.getLogger(getClass().getName());

    
    @Bean(name="viewResolver")
    public InternalResourceViewResolver getViewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }
    
    @Bean
    public DataSource getDataSource(){
        ComboPooledDataSource securityDataSource = new ComboPooledDataSource();

        //set the jdbc driver class
        try {
            securityDataSource.setDriverClass(env.getProperty("jdbc.driverClassName"));
            securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
            securityDataSource.setUser(env.getProperty("jdbc.username"));
            securityDataSource.setPassword(env.getProperty("jdbc.password"));
        } catch (PropertyVetoException e) {
            throw new RuntimeException(e);
        }

        //log the connection props
        logger.info(">>> jdbc.url=" + env.getProperty("jdbc.url"));
        logger.info(">>> jdbc.user=" + env.getProperty("jdbc.user"));

        /*securityDataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
        securityDataSource.setMinPoolSize(getIntProperty("connection.pool.minPollSize"));
        securityDataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
        securityDataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));*/
        
        // set connection pool props
        return securityDataSource;
    }
    
    private int getIntProperty(String propName){
        String propVal = env.getProperty(propName);
        int intPropVal = Integer.parseInt(propVal);
        return intPropVal;
    }
    
    @Bean
    public JdbcTemplate jdbcTemplate(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
        return jdbcTemplate;
    }
    
    @Bean(name = "multipartResolver")
    public MultipartResolver getMultipartResolver() {
        CommonsMultipartResolver resover = new CommonsMultipartResolver();
        // 1MB
        resover.setMaxUploadSize(1 * 1024 * 1024);
 
        return resover;
    }
}
