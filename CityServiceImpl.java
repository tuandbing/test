package com.example.demo.service;

import com.example.demo.mapper.CityMapper;
import com.example.demo.pojo.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class CityServiceImpl implements CityService{

    @Autowired
    private CityMapper cityMapper;


    @Override
    public List<City> getCityByPid(Integer pid,RedisTemplate redisTemplate){

        List<City> cityList = null;

        List<City> cities = new ArrayList<>();

        if(redisTemplate.boundListOps("cityList").size() > 0){

            cityList = redisTemplate.boundListOps("cityList").range(0,-1);

            System.out.println("缓存");

        }else{

            cityList = cityMapper.getCities();

            for (City city : cityList) {

                redisTemplate.boundListOps("cityList").rightPush(city);

            }
            System.out.println("数据库");

        }

        for (City city : cityList) {
            if(city.getPid() != null && city.getPid().equals(pid)){
                cities.add(city);
            }
        }

        return cities;
    }
}
