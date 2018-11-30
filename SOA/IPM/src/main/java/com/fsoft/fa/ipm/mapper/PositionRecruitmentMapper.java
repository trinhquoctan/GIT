package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.PositionRecruitment;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class PositionRecruitmentMapper implements RowMapper<PositionRecruitment> {

    @Override
    public PositionRecruitment mapRow(ResultSet rs, int rowNum) throws SQLException {
        PositionRecruitment pr = new PositionRecruitment();
        pr.setPositionID(rs.getInt("position_id"));
        pr.setRecruitmentID(rs.getInt("recruitment_id"));
        pr.setQuantity(rs.getInt("quantity"));
        pr.setSalary(rs.getInt("salary"));
        return pr;
    }
    
}
