package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.SkillPosition;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class SkillPositionMapper implements RowMapper<SkillPosition>{

    @Override
    public SkillPosition mapRow(ResultSet rs, int rowNum) throws SQLException {
        SkillPosition sp = new SkillPosition();
        sp.setPositionID(rs.getInt("position_id"));
        sp.setSkillID(rs.getInt("skill_id"));
        return sp;
    }
    
}
