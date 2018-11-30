package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.SkillCandidate;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class SkillCandidateMapper implements RowMapper<SkillCandidate>{

    @Override
    public SkillCandidate mapRow(ResultSet rs, int rowNum) throws SQLException {
        SkillCandidate sc = new SkillCandidate();
        sc.setCandidateID(rs.getInt("candidate_id"));
        sc.setSkillID(rs.getInt("skill_id"));
        return sc;
    }
    
}
