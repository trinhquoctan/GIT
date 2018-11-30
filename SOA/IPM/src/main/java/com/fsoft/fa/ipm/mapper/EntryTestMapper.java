package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.EntryTest;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class EntryTestMapper implements RowMapper<EntryTest>{

    @Override
    public EntryTest mapRow(ResultSet rs, int rowNum) throws SQLException {
        EntryTest e = new EntryTest();
        e.setId(rs.getInt("id"));
        e.setName(rs.getString("name"));
        e.setPositionID(rs.getInt("position_id"));
        e.setCandidateID(rs.getInt("candidate_id"));
        e.setRound(rs.getInt("round"));
        e.setResult(rs.getString("result"));
        return e;
    }
    
}
