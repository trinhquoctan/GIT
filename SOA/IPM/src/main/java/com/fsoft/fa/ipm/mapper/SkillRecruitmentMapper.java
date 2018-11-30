
package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.SkillRecruitment;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class SkillRecruitmentMapper implements RowMapper<SkillRecruitment>{

    @Override
    public SkillRecruitment mapRow(ResultSet rs, int rowNum) throws SQLException {
        SkillRecruitment s = new SkillRecruitment();
        s.setRecruitmentID(rs.getInt("recruitment_id"));
        s.setSkillID(rs.getInt("skill_id"));
        return s;
    }
    
}
