package com.fsoft.fa.ipm.mapper;

import com.fsoft.fa.ipm.model.Position;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class PositionMapper implements RowMapper<Position>{

    @Override
    public Position mapRow(ResultSet rs, int i) throws SQLException {
        Position p = new Position();
        p.setId(rs.getInt("id"));
        p.setName(rs.getString("name"));
        p.setProcess(rs.getInt("process"));
        p.setQuantity(rs.getInt("quantity"));
        return p;
    }
    
}
