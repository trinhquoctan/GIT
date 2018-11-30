package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.Candidate;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class CandidateMapper implements RowMapper<Candidate>{

    public CandidateMapper() {
    }

    @Override
    public Candidate mapRow(ResultSet rs, int rowNum) throws SQLException {
        Candidate c = new Candidate();
        c.setCandidateID(rs.getInt("id"));
        c.setFullname(rs.getString("fullname"));
        c.setMajor(rs.getString("major"));
        c.setBirthday(rs.getString("birthday"));
        c.setSkill(null);
        c.setGender(rs.getString("gender"));
        c.setIdCard(rs.getString("id_card"));
        c.setEmail(rs.getString("email"));
        c.setPhone(rs.getInt("phone"));
        c.setDateCreate(rs.getString("date_create"));
        c.setStatus(rs.getString("status"));
        c.setCv(rs.getString("cv"));
        return c;
    }
    
}
