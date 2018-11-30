package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.Interview;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class InterviewMapper implements RowMapper<Interview>{

    @Override
    public Interview mapRow(ResultSet rs, int rowNum) throws SQLException {
        Interview i = new Interview();
        i.setId(rs.getInt("id"));
        i.setDate(rs.getString("date"));
        i.setTime(rs.getString("time"));
        i.setLocation(rs.getString("location"));
        i.setCandiateID(rs.getInt("candidate_id"));
        i.setUsername(rs.getString("username"));
        i.setResult(rs.getString("result"));
        return i;
    }
    
}
