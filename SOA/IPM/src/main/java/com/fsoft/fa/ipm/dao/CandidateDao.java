package com.fsoft.fa.ipm.dao;

import com.fsoft.fa.ipm.mapper.CandidateMapper;
import com.fsoft.fa.ipm.mapper.SkillCandidateMapper;
import com.fsoft.fa.ipm.model.Candidate;
import com.fsoft.fa.ipm.model.Skill;
import com.fsoft.fa.ipm.model.SkillCandidate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CandidateDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    SkillDao skillDao;
    
    public List<Candidate> getAll() {
        String sql = "select * from candidate";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
    
    public Candidate getById(Integer id) {
        String sql = "select * from candidate where id=?";
        Candidate c = jdbcTemplate.queryForObject(sql, new Object[]{id}, new CandidateMapper());
        HashMap<Integer,String> hm = new HashMap<Integer,String>();
        for(Skill sk:skillDao.findAll()){
            hm.put(sk.getId(), sk.getName());
        }
        
        sql = "select * from skill_candidate where candidate_id=?";
        List<SkillCandidate> sclst = jdbcTemplate.query(sql, new Object[]{id}, new SkillCandidateMapper());
        if(!sclst.isEmpty()){
            String[] skillList = new String[sclst.size()];
            for(int i = 0; i<sclst.size();i++){
                skillList[i] = hm.get(sclst.get(i).getSkillID());
            }
            c.setSkill(skillList);
        }
        return c;
    }
    
    public List<Candidate> getByFullname(String fullname) {
        String sql = "select * from candidate where fullname=?";
        List<Candidate> list = jdbcTemplate.query(sql, new Object[]{fullname}, new CandidateMapper());
        return list;
    }
    
    public List<Candidate> sortByFullname() {
        String sql = "select * from candidate order by fullname asc";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
    
    public List<Candidate> getByMajor(String major) {
        String sql = "select * from candidate where major=?";
        List<Candidate> list = jdbcTemplate.query(sql, new Object[]{major}, new CandidateMapper());
        return list;
    }
    
    public List<Candidate> sortByMajor() {
        String sql = "select * from candidate order by major asc";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
        
    public List<Candidate> getByBirthday(Date birthday) {
        String sql = "select * from candidate where birthday=?";
        List<Candidate> list = jdbcTemplate.query(sql, new Object[]{birthday}, new CandidateMapper());
        return list;
    }
        
    public List<Candidate> sortByBirthday() {
        String sql = "select * from candidate order by birthday asc";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
    
    public List<Candidate> getByGender(String gender) {
        String sql = "select * from candidate where gender=?";
        List<Candidate> list = jdbcTemplate.query(sql, new Object[]{gender}, new CandidateMapper());
        return list;
    }
        
    public List<Candidate> sortByGender() {
        String sql = "select * from candidate order by gender asc";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
    
    public List<Candidate> getByEmail(String email) {
        String sql = "select * from candidate where email=?";
        List<Candidate> list = jdbcTemplate.query(sql, new Object[]{email}, new CandidateMapper());
        return list;
    }
        
    public List<Candidate> sortByEmail() {
        String sql = "select * from candidate order by email asc";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
    
    public List<Candidate> getByDateCreate(Date dateCreate) {
        String sql = "select * from candidate where date_create=?";
        List<Candidate> list = jdbcTemplate.query(sql, new Object[]{dateCreate}, new CandidateMapper());
        return list;
    }
        
    public List<Candidate> sortByDateCreate() {
        String sql = "select * from candidate order by date_create asc";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
    
    public List<Candidate> getByStatus(String status) {
        String sql = "select * from candidate where status=?";
        List<Candidate> list = jdbcTemplate.query(sql, new Object[]{status}, new CandidateMapper());
        return list;
    }
        
    public List<Candidate> sortByStatus() {
        String sql = "select * from candidate order by status asc";
        List<Candidate> list = jdbcTemplate.query(sql, new CandidateMapper());
        return list;
    }
    
    public Candidate addCandidate(Candidate c) {
        String sql = "insert into candidate(fullname, major, birthday, gender, id_card, email, "
                + "phone, date_create, status, cv) value (?,?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, c.getFullname(),c.getMajor(), c.getBirthday(), c.getGender(), c.getIdCard(), 
                c.getEmail(), c.getPhone(), c.getDateCreate(), c.getStatus(), c.getCv());
        sql = "select * from candidate where id_card = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{c.getIdCard()},new CandidateMapper());
        
    }
    
    
    public void UpdateCandidateInfor(Candidate c) {
        String sql = "update candidate set fullname=?, major=?, birthday=?, gender=?, id_card=?, "
                + "email=?, phone=?, status=? where id=?";
        jdbcTemplate.update(sql, c.getFullname(),c.getMajor(), c.getBirthday(), c.getGender(), c.getIdCard(), c.getEmail(),
                c.getPhone(), c.getStatus(), c.getCandidateID());
    }
    
    public void deleteById(Integer id) {
        String sql = "delete from candidate where id=?";
        jdbcTemplate.update(sql, id);
    }
}
