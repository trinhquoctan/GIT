package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.Recruitment;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class RecruitmentMapper implements RowMapper<Recruitment>{

    @Override
    public Recruitment mapRow(ResultSet rs, int i) throws SQLException {
        Recruitment r = new Recruitment();
        r.setId(rs.getInt("id"));
        r.setTitle(rs.getString("title"));
        r.setContent(rs.getString("content"));
        r.setDateCreate(rs.getDate("date_create"));
        r.setDateEnd(rs.getDate("date_end"));
        
        return r;
    }
    
}
