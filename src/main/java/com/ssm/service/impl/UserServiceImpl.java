package com.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ssm.mapper.UserMapper;

import com.ssm.model.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 作者:wj
 * 时间:2018/12/18
 */
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Override
    public JSONObject listUserJson(JSONObject jsonObject) {
        //服务器必须返回rows,total
        List<User> rows = userMapper.listUsers(jsonObject);
        long total= userMapper.countUsers(jsonObject);
        JSONObject jo=new JSONObject();
        jo.put("rows",rows);
        jo.put("total",total);
        return jo;
    }

    @Override
    public User selectUserById(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public int deleteUser(int id) {
        return userMapper.deleteUser(id);

    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);

    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);

    }


    /**
     * 前台查询所有
     */
    @Override
    public List<User> queryAllUsers() {
        return userMapper.getListUsers();
    }
}
