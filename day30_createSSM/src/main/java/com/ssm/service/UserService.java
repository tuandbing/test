package com.ssm.service;

import com.ssm.pojo.User;

import java.util.HashMap;
import java.util.List;

public interface UserService {

    List<User> getUserList(HashMap<String,Object> map);

    Integer insert(User user);

    Integer delete(Integer id);

    Integer update(User user);

    User selectUserById(Integer id);

    Integer deleteUsers(HashMap<String,Object> map);
}
