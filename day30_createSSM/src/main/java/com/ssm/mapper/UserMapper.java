package com.ssm.mapper;

import com.ssm.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface UserMapper {

    List<User> getUserList(HashMap<String,Object> map);

    Integer insert(User user);

    Integer delete(Integer id);

    Integer update(User user);

    User selectUserById(Integer id);


    Integer deleteUsers(HashMap<String,Object> map);
}
