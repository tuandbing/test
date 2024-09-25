package com.eagles.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/test01")
    public ModelAndView test01(){

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("message","hello");

        modelAndView.setViewName("test");

        return modelAndView;

    }

    @RequestMapping("/test02")
    public String test02(){

        return "redirect:/test";

    }


}
