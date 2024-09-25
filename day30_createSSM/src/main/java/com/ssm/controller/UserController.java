package com.ssm.controller;

import com.ssm.pojo.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("list")
    public String getUserList(Model model,String likeName){

        HashMap<String, Object> map = new HashMap<>();

        if(likeName != null && !likeName.equals("")){
            map.put("likeName",likeName);
            model.addAttribute("likeName",likeName);
        }

        model.addAttribute("userList",userService.getUserList(map));

        return "list";

    }

    @RequestMapping("toUpdate")
    public String toUpdate(){

        return "update";

    }

    @RequestMapping("update")
    @ResponseBody
    public String update(User user){

        Integer update = userService.update(user);

        return update == 1 ? "true" : "false";

    }
    @RequestMapping("selectUserById")
    public String selectUserById(Model model,Integer id){

        User user = userService.selectUserById(id);
        model.addAttribute("user",user);

        return "update";

    }
    @RequestMapping("deleteUserById")
    @ResponseBody
    public String deleteUserById(Integer id){

        Integer delete = userService.delete(id);

        return delete == 1 ? "true" : "false";

    }

    @RequestMapping("insert")
    @ResponseBody
    public String insert(User user){

        Integer insert = userService.insert(user);

        return insert == 1 ? "true" : "false";

    }

    @RequestMapping("deleteUserByIds")
    @ResponseBody
    public String deleteUserByIds(String Ids){

        HashMap<String, Object> map = new HashMap<>();

        map.put("ids",Ids);

        Integer num = userService.deleteUsers(map);

        return num > 0 ? "true" : "false";

    }

}
