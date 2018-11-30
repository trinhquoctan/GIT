package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.RecruitmentMapper;
import com.fsoft.fa.ipm.model.Recruitment;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class RecruitmentDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
        
    public List<Recruitment> findAll() {
        String sql = "select * from recruitment";
        List<Recruitment> list = jdbcTemplate.query(sql, new RecruitmentMapper());
        return list;
    }
    
    public List<Recruitment> getByTitle(String title) {
        String sql = "select * from recruitment where title=?";
        List<Recruitment> list = jdbcTemplate.query(sql, new Object[]{title}, new RecruitmentMapper());
        return list;
    }
    
    public List<Recruitment> sortByTitle() {
        String sql = "select * from recruitment order by title asc";
        List<Recruitment> list = jdbcTemplate.query(sql, new RecruitmentMapper());
        return list;
    }
    
    public List<Recruitment> getByDateCreated(Date dateCreated) {
        String sql = "select * from recruitment where date_create=?";
        List<Recruitment> list = jdbcTemplate.query(sql, new Object[]{dateCreated}, new RecruitmentMapper());
        return list;
    }
    
    public List<Recruitment> sortByDateCreated() {
        String sql = "select * from recruitment order by date_create asc";
        List<Recruitment> list = jdbcTemplate.query(sql, new RecruitmentMapper());
        return list;
    }
    
    public List<Recruitment> getByDateEnd(Date dateEnd) {
        String sql = "select * from recruitment where date_end=?";
        List<Recruitment> list = jdbcTemplate.query(sql, new Object[]{dateEnd}, new RecruitmentMapper());
        return list;
    }
    
    public List<Recruitment> sortByDateEnd() {
        String sql = "select * from recruitment order by date_end asc";
        List<Recruitment> list = jdbcTemplate.query(sql, new RecruitmentMapper());
        return list;
    }
    
    public void addRecruitment(Recruitment r){
        String sql = "INSERT INTO recruitment (title, content, date_create, date_end) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, r.getTitle(), r.getContent(), r.getDateCreate(), r.getDateEnd());
    }
    
    public void UpdatePositionInfor(Recruitment r) {
        String sql = "update recruitment set name=?, description=? where id=?";
        jdbcTemplate.update(sql, r.getTitle(), r.getContent(), r.getDateCreate(), r.getDateEnd());
    }
    
    public boolean deleteById(Recruitment r) {
        boolean flag = false;
        try {
            String sql = "delete from recruitment where username=?";
            jdbcTemplate.update(sql, r.getId());
            flag = true;
        } catch (DataAccessException ex) {
        }
        return flag;
    }
}
