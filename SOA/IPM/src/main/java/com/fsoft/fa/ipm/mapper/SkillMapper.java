package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.Skill;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class SkillMapper implements RowMapper<Skill>{

    @Override
    public Skill mapRow(ResultSet rs, int i) throws SQLException {
        Skill r = new Skill();
        r.setId(rs.getInt("id"));
        r.setName(rs.getString("name"));
        return r;
    }
    
}
