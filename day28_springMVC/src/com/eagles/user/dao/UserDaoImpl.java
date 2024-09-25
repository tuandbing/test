package com.eagles.user.dao;

import com.eagles.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;


    @Override
    public List<User> getUserList() {
        return jdbcTemplate.query("select * from tb_user", new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet resultSet, int i) throws SQLException {
                int id = resultSet.getInt("id");

                String username = resultSet.getString("username");

                String address = resultSet.getString("address");

                return new User(id,username,address);
            }
        });
    }
}
