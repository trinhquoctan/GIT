package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.SkillMapper;
import com.fsoft.fa.ipm.model.Skill;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SkillDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Skill> findAll() {
        String sql = "select * from skill";
        List<Skill> list = jdbcTemplate.query(sql, new SkillMapper());
        return list;
    }

    public Skill findOne(int id) {
        String sql = "select * from skill where id=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new SkillMapper());
    }
    
    public List<Skill> findByID(int id) {
        String sql = "select * from skill where id=?";
        List<Skill> list = jdbcTemplate.query(sql, new Object[]{id}, new SkillMapper());
        return list;
    }
    
    public Skill findByName(String name) {
        String sql = "select * from skill where name=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{name}, new SkillMapper());
    }
    
    //public List<Skill> getAllSkill();
    public boolean addSkill(Skill sk) {
        boolean flag = false;
        try {
            String query = "insert into skill (name) values (?)";
            jdbcTemplate.update(query, sk.getName());
            flag = true;
        } catch (DataAccessException e) {
        }
        return flag;
    }

    public void updateSkill(Skill sk) {
        String query = "update skill set name=? where id=?";
        jdbcTemplate.update(query, sk.getName(), sk.getId());
    }
    
    public int deleteSkill(int id) {
        String query = "delete from skill where id = ?";
        return jdbcTemplate.update(query, id);
    }
}
