package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.Major;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class MajorMapper implements RowMapper<Major> {

    @Override
    public Major mapRow(ResultSet rs, int rowNum) throws SQLException {
        Major m = new Major();
        m.setId(rs.getInt("id"));
        m.setName(rs.getString("name"));
        return m;
    }

}
