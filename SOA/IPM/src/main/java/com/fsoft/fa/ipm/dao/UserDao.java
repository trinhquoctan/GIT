package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.UserMapper;
import com.fsoft.fa.ipm.model.User;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<User> getAll() {
        String sql = "select * from users where enabled>0";
        List<User> list = jdbcTemplate.query(sql, new UserMapper());
        return list;
    }

    public User getOne(String username) {
        String sql = "select * from users where username=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{username}, new UserMapper());
    }

    public List<User> getByUsername(String username) {
        String sql = "select * from users where username=?";
        List<User> list = jdbcTemplate.query(sql, new Object[]{username}, new UserMapper());
        return list;
    }

    public List<User> getByRole(String role) {
            String sql = "select * from users where role=?";
        List<User> list = jdbcTemplate.query(sql, new Object[]{role}, new UserMapper());
        return list;
    }

    public List<User> getByFullname(String fullname) {
        String sql = "select * from users where fullname=?";
        List<User> list = jdbcTemplate.query(sql, new Object[]{fullname}, new UserMapper());
        return list;
    }

    public List<User> getByEmail(String email) {
        String sql = "select * from users where email=?";
        List<User> list = jdbcTemplate.query(sql, new Object[]{email}, new UserMapper());
        return list;
    }

    public List<User> getByStatus(String status) {
        String sql = "select * from users where email=?";
        List<User> list = jdbcTemplate.query(sql, new Object[]{status}, new UserMapper());
        return list;
    }

    public boolean addUser(User u) {
        boolean flag = false;
        try {
            String sql = "insert into users (username, password, role, fullname, phone, email, enabled) values (?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql, u.getUsername(), u.getPassword(), u.getRole(), u.getFullname(), u.getPhone(), u.getEmail(), u.getEnabled());
            
            if("admin".equals(u.getRole())){
                String sql1 = "insert into authorities (username, authority) values (?,?)";
                jdbcTemplate.update(sql1, u.getUsername(), "ROLE_ADMIN");
                String sql2 = "insert into authorities (username, authority) values (?,?)";
                jdbcTemplate.update(sql2, u.getUsername(), "ROLE_HR");
                String sql3 = "insert into authorities (username, authority) values (?,?)";
                jdbcTemplate.update(sql3, u.getUsername(), "ROLE_INTERVIEWER");
            }
            
            else if("HR".equals(u.getRole())){
                String sql1 = "insert into authorities (username, authority) values (?,?)";
                jdbcTemplate.update(sql1, u.getUsername(), "ROLE_HR");
                String sql2 = "insert into authorities (username, authority) values (?,?)";
                jdbcTemplate.update(sql2, u.getUsername(), "ROLE_INTERVIEWER");
            }
            
            else if("interviewer".equals(u.getRole())){
                String sql1 = "insert into authorities (username, authority) values (?,?)";
                jdbcTemplate.update(sql1, u.getUsername(), "ROLE_INTERVIEWER");
            }
            
            flag = true;
        } catch (DataAccessException ex) {
        }
        return flag;
    }

    public void updateUser(User u) {
        String sql = "update users set password=?, role=?, fullname=?, phone=?, email=?, status=? where username=?";
        jdbcTemplate.update(sql, u.getPassword(), u.getRole(), u.getFullname(), u.getPhone(), u.getEmail(), u.getEnabled(), u.getUsername());
    }
    
    public void updateStatus(User u) {
        int status = 0; 
        String sql = "update users set status=? where username=?";
        jdbcTemplate.update(sql, status, u.getUsername());
    }

    public void deleteByUsername(String name) {
       int status = 0; 
        String sql = "update users set enabled=? where username=?";
        jdbcTemplate.update(sql, status, name);
    }
}
