package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.model.PositionCandidate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class PositionCandidateDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public void addPositionCandidate(PositionCandidate pc){
        String sql = "INSERT INTO candidate (position_id, candidate_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, pc.getPositionID(), pc.getCandidateID());
    }
}
