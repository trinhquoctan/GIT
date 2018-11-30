package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.Potential;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class PotentialMapper implements RowMapper<Potential>{

    @Override
    public Potential mapRow(ResultSet rs, int rowNum) throws SQLException {
        Potential p = new Potential();
        p.setCandidateID(rs.getInt("candidate_id"));
        p.setPositionID(rs.getInt("position_id"));
        return p;
    }
    
}
