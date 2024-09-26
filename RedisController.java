package com.example.demo.controller;

import com.example.demo.pojo.City;
import com.example.demo.pojo.User;
import com.example.demo.service.CityService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/redis")
public class RedisController {

    @Autowired
    private UserService userService;

    @Autowired
    private CityService cityService;

    @Autowired
    private RedisTemplate redisTemplate;

    @RequestMapping("/list")
    @ResponseBody
    public List<User> getUserList(){

        List<User> userList = null;

        if (redisTemplate.boundListOps("userList").size() > 0){

            userList = redisTemplate.boundListOps("userList").range(0,-1);

            System.out.println("从redis缓存中取数据");
        }else{

            userList = userService.getUserList();

            for (User user : userList) {
                redisTemplate.boundListOps("userList").rightPush(user);

            }
            System.out.println("从mysql数据库中取数据");

        }

        return userList;

    }

    @RequestMapping("/city")
    public String toCity(){

        return "city";

    }

    @RequestMapping("/findCityByPid")
    @ResponseBody
    public List<City> findCityByPid(Integer pid){

        return cityService.getCityByPid(pid,redisTemplate);

    }
}
