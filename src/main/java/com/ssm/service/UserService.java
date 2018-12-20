package com.ssm.service;


import com.alibaba.fastjson.JSONObject;
import com.ssm.model.User;

import java.util.List;

/**
 * 作者:wj
 * 时间:2018/12/18
 */
public interface UserService {

    //分页查询
    JSONObject listUserJson(JSONObject jsonObject);

    //根据ID进行查询用户
    User selectUserById(int id);

    //增加用户
    int addUser(User user);


    //修改用户
   int updateUser(User user);

    //删除用户

    int deleteUser(int id);

    //前台查询所有
    List<User> queryAllUsers();

}
