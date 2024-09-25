package com.eagles.user.controller;

import com.eagles.user.pojo.User;
import com.eagles.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


public class UserController implements Controller {

    @Autowired
    private UserService userService;

    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        List<User> userList = userService.getUserList();

        modelAndView.addObject("userList",userList);

        modelAndView.setViewName("list");

        return modelAndView;
    }
}
