package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.SkillRecruitmentMapper;
import com.fsoft.fa.ipm.model.SkillRecruitment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class SkillRecruitmentDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public void addSkillRecruitment(SkillRecruitment sr){
        String sql = "INSERT INTO skill_recruitment (recruitment_id) VALUES (?)";
        jdbcTemplate.update(sql, sr.getRecruitmentID());
    }
    
    public List<SkillRecruitment> findAll(){
        String sql = "SELECT * FROM skill_recruitment";
        List<SkillRecruitment> list = jdbcTemplate.query(sql, new SkillRecruitmentMapper());
        return list;
    }
}
