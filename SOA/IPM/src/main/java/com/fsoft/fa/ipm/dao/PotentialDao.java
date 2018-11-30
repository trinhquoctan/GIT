package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.PotentialMapper;
import com.fsoft.fa.ipm.model.Potential;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PotentialDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<Potential> findAll(){
        String sql = "SELECT * FROM potential";
        List<Potential> list = jdbcTemplate.query(sql, new PotentialMapper());
        return list;
    }    
   
    public void addPotential(Potential p){
        String sql = "INSERT INTO potential (candidate_id, position_id) VALUES (?,?)";
        jdbcTemplate.update(sql, p.getCandidateID(), p.getPositionID());
    }
        
}
