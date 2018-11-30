package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.SkillCandidateMapper;
import com.fsoft.fa.ipm.mapper.SkillMapper;
import com.fsoft.fa.ipm.model.SkillCandidate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class SkillCandidateDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<SkillCandidate> findAll(){
        String sql = "SELECT * FROM skill_candidate";
        List<SkillCandidate> list = jdbcTemplate.query(sql, new SkillCandidateMapper());
        return list;
    }
    
    public List<SkillCandidate> findBySkill(int skillID) {
        String sql = "select * from skill_candidate where skill_id=?";
        List<SkillCandidate> list = jdbcTemplate.query(sql, new Object[]{skillID}, new SkillCandidateMapper());
        return list;
    }
    
    public List<SkillCandidate> findByCandidate(int candidateID) {
        String sql = "select * from skill_candidate where candidate_id=?";
        List<SkillCandidate> list = jdbcTemplate.query(sql, new Object[]{candidateID}, new SkillCandidateMapper());
        return list;
    }
    
    public void deleteSkillCandidate(int candidateID){
        String sql = "delete from skill_candidate where candidate_id =?";
        jdbcTemplate.update(sql,candidateID);
    }
    
    public boolean addSkillCandidate(SkillCandidate sc) {
        boolean flag = false;
        try {
            String query = "insert into skill_candidate (skill_id, candidate_id) values (?,?)";
            jdbcTemplate.update(query, sc.getCandidateID(), sc.getSkillID());
            flag = true;
        } catch (DataAccessException e) {
        }
        return flag;
    }
    
    public void add(String skillName, int cId){
        String sql = "select * from skill where name=?";
        int sId = jdbcTemplate.queryForObject(sql, new Object[]{skillName},new SkillMapper()).getId();
        sql = "insert into skill_candidate (skill_id, candidate_id) values (?,?)";
        jdbcTemplate.update(sql,sId,cId);
    }
}
