package com.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.model.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //查询分页
    @ResponseBody
    @RequestMapping("/userByPage")
    public JSONObject listUsers(@RequestBody JSONObject jsonObject){
        jsonObject=userService.listUserJson(jsonObject);
        return jsonObject;
    }

    //根据id查询用户
    @ResponseBody
    @RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
    public User getUserById(@PathVariable("id") int id){
        return userService.selectUserById(id);
    }



    //增加用户
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public String  addUser(User user){
        userService.addUser(user);
        return "list";

    }


    //修改用户
   /* @ResponseBody
        @RequestMapping(value = "/update",method = RequestMethod.GET)
        public int updateUser(User user){
        return userService.updateUser(user);
    }
*/



    //删除用户
    @ResponseBody
    @RequestMapping(value = "/user/{id}",method = RequestMethod.POST)
    public int deleteUser(@PathVariable("id") int id){
        return userService.deleteUser(id);
    }



    //从from接收过来真正的修改信息
    @RequestMapping(value = "/userUpdate",method = RequestMethod.POST)
    public String  update(User user){
      userService.updateUser(user);
        return "list";
    }





    /**
     *
     * 前端页面展示部分,查询所有用户,即只能查询等权限
     */
    @RequestMapping("/userList")
    public  String userList(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer pageSize,Model model){
        Page<Object> objects = PageHelper.startPage(currentPage, pageSize);
        List<User> list = userService.queryAllUsers();
        PageInfo<User> pageInfo = new PageInfo<>(list, 5);

        int[] nums = pageInfo.getNavigatepageNums();  //当前页
        model.addAttribute("nums", nums);
        model.addAttribute("list",list);   //查询到的总个数
        model.addAttribute("page",pageInfo);
        return "userInfo";


    }



}

