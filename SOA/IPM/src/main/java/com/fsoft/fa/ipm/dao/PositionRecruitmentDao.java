package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.PositionRecruitmentMapper;
import com.fsoft.fa.ipm.model.PositionRecruitment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class PositionRecruitmentDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<PositionRecruitment> findAll() {
        String sql = "select * from position_recruitment";
        List<PositionRecruitment> list = jdbcTemplate.query(sql, new PositionRecruitmentMapper());
        return list;
    }
    
    public List<PositionRecruitment> findByPosition(int positionID) {
        String sql = "select * from position_recruitment where position_id=?";
        List<PositionRecruitment> list = jdbcTemplate.query(sql, new Object[]{positionID}, new PositionRecruitmentMapper());
        return list;
    }
    
    public List<PositionRecruitment> findByRecruitment(int recruitmentID) {
        String sql = "select * from position_recruitment where recruitment_id=?";
        List<PositionRecruitment> list = jdbcTemplate.query(sql, new Object[]{recruitmentID}, new PositionRecruitmentMapper());
        return list;
    }
    
    public boolean addPositionRecruitment(PositionRecruitment pr) {
        boolean flag = false;
        try {
            String query = "insert into position_recruitment (position_id, recruitment_id, quantity, salary) values (?,?,?,?)";
            jdbcTemplate.update(query, pr.getPositionID(), pr.getRecruitmentID(), pr.getQuantity(), pr.getSalary());
            flag = true;
        } catch (DataAccessException e) {
        }
        return flag;
    }
}
