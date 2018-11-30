package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.SkillPositionMapper;
import com.fsoft.fa.ipm.model.SkillPosition;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SkillPositionDao {
    
     @Autowired
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    public List<SkillPosition> findAll() {
        String sql = "select * from skill_position";
        List<SkillPosition> list = jdbcTemplate.query(sql, new SkillPositionMapper());
        return list;
    }

    public List<SkillPosition> findBySkill(int skillID) {
        String sql = "select * from skill_position where skill_id=?";
        List<SkillPosition> list = jdbcTemplate.query(sql, new Object[]{skillID}, new SkillPositionMapper());
        return list;
    }
    
    public List<SkillPosition> findByPosition(int positionID) {
        String sql = "select * from skill_position where position_id=?";
        List<SkillPosition> list = jdbcTemplate.query(sql, new Object[]{positionID}, new SkillPositionMapper());
        return list;
    }
    
    public int deleteByPositionId(int positionId) {
    	String query = "delete from skill_position where position_id = ?";
    	return jdbcTemplate.update(query, positionId);
    }
    
    public int deleteOne(SkillPosition sp) {
    	String query = "delete from skill_position where position_id = ? and skill_id = ?";
    	return jdbcTemplate.update(query, sp.getPositionID(), sp.getSkillID());
    }
    
    public boolean addSkillPosition(SkillPosition sp) {
        boolean flag = false;
        try {
            String query = "insert into skill_position (skill_id, position_id) values (?,?)";
            jdbcTemplate.update(query, sp.getPositionID(), sp.getSkillID());
            flag = true;
        } catch (DataAccessException e) {
        }
        return flag;
    }

}
