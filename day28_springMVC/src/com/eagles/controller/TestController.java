package com.eagles.controller;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        // 创建模型视图对象
        ModelAndView modelAndView = new ModelAndView();

        // 封装数据到model中，model底层封装的是request，所以取值范围是依次请求转发范围内
        // 存储数据
        modelAndView.addObject("message","Hello SpringMVC");

        // 设置视图名称
        modelAndView.setViewName("test");

        return modelAndView;
    }
}
