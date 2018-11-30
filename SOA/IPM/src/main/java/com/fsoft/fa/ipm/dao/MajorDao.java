package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.MajorMapper;
import com.fsoft.fa.ipm.model.Major;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MajorDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    public List<Major> findAll() {
        String sql = "select * from major";
        List<Major> list = jdbcTemplate.query(sql, new MajorMapper());
        return list;
    }
    
    public List<Major> findByID(int id) {
        String sql = "select * from major where id=?";
        List<Major> list = jdbcTemplate.query(sql, new Object[]{id}, new MajorMapper());
        return list;
    }
    
    public Major findOne(String name) {
        String sql = "select * from major where name=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{name}, new MajorMapper());
    }
    
    public List<Major> getByMajor(String name) {
        String sql = "select * from major where name=?";
        List<Major> list = jdbcTemplate.query(sql, new Object[]{name}, new MajorMapper());
        return list;
    }
    
    public int deleteMajor(int id){
        String query = "delete from major where id=?";
        return jdbcTemplate.update(query, id);
    }
    
    public boolean addMajor(Major m) {
        boolean flag = false;
        try{
            String sql = "insert into major (name) values (?)";
            jdbcTemplate.update(sql, m.getName());
            flag = true;
        }catch(DataAccessException e){
        }
        return flag;
    }
    
    public void updateMajor(Major m) {
        String sql = "update major set name=? where id=?";
        jdbcTemplate.update(sql, m.getName(), m.getId());
    }
   
}
