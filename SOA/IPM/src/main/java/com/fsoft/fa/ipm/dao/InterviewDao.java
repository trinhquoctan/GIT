package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.InterviewMapper;
import com.fsoft.fa.ipm.model.Interview;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class InterviewDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<Interview> getAll(){
        String sql = "SELECT * FROM interview";
        List<Interview> list = jdbcTemplate.query(sql, new InterviewMapper());
        return list;
    }
    
    public List<Interview> getByDate(Date date) {
        String sql = "select * from interview where date=?";
        List<Interview> list = jdbcTemplate.query(sql, new Object[]{date}, new InterviewMapper());
        return list;
    }
    
    /*public List<Interview> getByTime(Time time) {
        String sql = "select * from interview where date=?";
        List<Interview> list = jdbcTemplate.query(sql, new Object[]{time}, new InterviewMapper());
        return list;
    }
    
    public List<Interview> sortByDateTime() {
        String sql = "select * from interview order by date asc, time asc";
        List<Interview> list = jdbcTemplate.query(sql, new InterviewMapper());
        return list;
    }*/
    
    public List<Interview> getByLocation(String location) {
        String sql = "select * from interview where location=?";
        List<Interview> list = jdbcTemplate.query(sql, new Object[]{location}, new InterviewMapper());
        return list;
    }
    
    public List<Interview> sortByLocation() {
        String sql = "select * from interview order by location asc";
        List<Interview> list = jdbcTemplate.query(sql, new InterviewMapper());
        return list;
    }
    
    public List<Interview> getByUsername(String username) {
        String sql = "select * from interview where username=?";
        List<Interview> list = jdbcTemplate.query(sql, new Object[]{username}, new InterviewMapper());
        return list;
    }
    
    public List<Interview> sortByUsername() {
        String sql = "select * from interview order by username asc";
        List<Interview> list = jdbcTemplate.query(sql, new InterviewMapper());
        return list;
    }
    
    public void addInterview(Interview i){
        String sql = "INSERT INTO interview (date, time, location, candidate_id, username, result) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, i.getDate(), i.getTime(), i.getLocation(), i.getCandiateID(), i.getUsername(), i.getResult());
    }
    
    public void UpdateInterviewInfor(Interview i) {
        
        String sql = "update interview set date=?, time=?, location=?, candidate_id=?, username=?, result=? where id=?";
        jdbcTemplate.update(sql, i.getDate(), i.getTime(), i.getLocation(), i.getCandiateID(), i.getUsername(), i.getResult(), i.getId());
    }
    
    public boolean deleteById(int id) {
        boolean flag = false;
        try {
            String sql = "delete from interview where id=?";
            jdbcTemplate.update(sql, id);
            flag = true;
        } catch (DataAccessException ex) {
        }
        return flag;
    }
}
