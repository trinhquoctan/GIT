/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.UserMapper;
import com.fsoft.fa.ipm.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ThieuIT
 */

@Repository
public class ProfileDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public User findOne(String username){
        String query = "select * from users where username=?";
        return jdbcTemplate.queryForObject(query, new Object[] {username}, new UserMapper());
    }
    
    public void updateProfile(User user){
        String query = "update users set fullname=?,phone=?,email=? where username =? ";
        jdbcTemplate.update(query,user.getFullname(),user.getPhone(),user.getEmail(),user.getUsername());
    }
}
