package com.eagles.user.service;

import com.eagles.user.dao.UserDao;
import com.eagles.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> getUserList() {
        System.out.println("-------");
        return userDao.getUserList();
    }
}
