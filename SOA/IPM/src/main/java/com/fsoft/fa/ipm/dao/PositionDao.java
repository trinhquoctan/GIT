package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.PositionMapper;
import com.fsoft.fa.ipm.model.Position;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PositionDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public List<Position> findAll(){
        String sql = "SELECT * FROM position";
        List<Position> list = jdbcTemplate.query(sql, new PositionMapper());
        return list;
    }    
    
    public Position findOne(int id) {
        String sql = "select * from position where id=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new PositionMapper());
    }
    
    public List<Position> findByID(int id) {
        String sql = "select * from position where id=?";
        List<Position> list = jdbcTemplate.query(sql, new Object[]{id}, new PositionMapper());
        return list;
    }
    
    public List<Position> findByName(String name) {
        String sql = "select * from position where name=?";
        List<Position> list = jdbcTemplate.query(sql, new Object[]{name}, new PositionMapper());
        return list;
    }
    
    public Position findByNameAndProcess(String name, int process) {
        String sql = "select * from position where name=? and process=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{name, process}, new PositionMapper());
    }
    
    public void addPosition(Position p){
        String sql = "insert into position (name, process) values (?, ?)";
        jdbcTemplate.update(sql, p.getName(), p.getProcess());
    }
        
    public void updatePosition(Position s) {
        String sql = "update position set name=?, process=?, quantity=? where id=?";
        jdbcTemplate.update(sql, s.getName(), s.getProcess(), s.getQuantity(), s.getId());
    }
    
    public int deleteById(int id) {
    	String query = "delete from position where id = ?";
    	return jdbcTemplate.update(query, id);
    }
    
}
