package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User>{

    public UserMapper() {
    }
    
    @Override
    public User mapRow(ResultSet rs, int i) throws SQLException {
        User u = new User();
        u.setUsername(rs.getString("username"));
        u.setPassword(rs.getString("password"));
        u.setRole(rs.getString("role"));
        u.setFullname(rs.getString("fullname"));
        u.setPhone(rs.getInt("phone"));
        u.setEmail(rs.getString("email"));
        u.setEnabled(rs.getInt("enabled"));
        return u;
    }
    
    
}
