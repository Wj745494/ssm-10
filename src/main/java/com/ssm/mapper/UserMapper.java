package com.ssm.mapper;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.User;
import java.util.List;


/**
 * 作者:wj
 * 时间:2018/12/17
 */
public interface UserMapper {

    /**
     * 根据id查询用户
     *
     */
    User getUserById(int id);



    /**
     * 增加用户
     */
    int addUser(User user);



    /**
     *
     * 删除用户
     */
   int deleteUser(int id);


    /**
     * 修改用户
     */
    int updateUser(User user);


    /**
     *
     * 查询所有分页
     */
    List<User> listUsers(JSONObject jsonObject);


    /**
     *
     * 查询总条数
     */
    long countUsers(JSONObject jsonObject);


    /**
     * 查询前台所有用户
     */
    List<User> getListUsers();
}
