package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.EntryTestMapper;
import com.fsoft.fa.ipm.model.EntryTest;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EntryTestDao {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<EntryTest> getAll() {
        String sql = "select * from entry_test";
        List<EntryTest> list = jdbcTemplate.query(sql, new EntryTestMapper());
        return list;
    }
    
    public EntryTest getById(Integer id) {
        String sql = "select * from entry_test where id=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new EntryTestMapper());
    }
    
    public List<EntryTest> getByName(String name) {
        String sql = "select * from entry_test where name=?";
        List<EntryTest> list = jdbcTemplate.query(sql, new Object[]{name}, new EntryTestMapper());
        return list;
    }
    
    public List<EntryTest> sortByName() {
        String sql = "select * from entry_test order by name asc";
        List<EntryTest> list = jdbcTemplate.query(sql, new EntryTestMapper());
        return list;
    }
    
    public void addEntryTest(EntryTest e) {
        String sql = "insert into entry_test(name, position_id, candidate_id, round, result) value (?,?,?,?,?)";
        jdbcTemplate.update(sql, new EntryTestMapper());
    }
    
    public void UpdateEntryTestInfor(EntryTest e) {
        String sql = "update entry_test set name=?, position_id=?, candidate_id=?, round=?, result=? where id=?";
        jdbcTemplate.update(sql, e.getName(), e.getPositionID(), e.getCandidateID(), e.getRound(), e.getResult(), e.getId());
    }
    
    public boolean deleteById(int id) {
        boolean flag = false;
        try {
            String sql = "delete from entry_test where id=?";
            jdbcTemplate.update(sql, id);
            flag = true;
        } catch (DataAccessException ex) {
        }
        return flag;
    }
}
