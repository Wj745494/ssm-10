package com.ssm.service;


import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Hotel;

import java.util.List;


public interface HotelService {

    //分页查询
    JSONObject listHotelJson(JSONObject jsonObject);

    //根据ID进行查询用户
    Hotel selectHotelById(int id);

    //增加用户
    int addHotel(Hotel hotel);


    //修改用户
   int updateHotel(Hotel hotel);

    //删除用户

    int deleteHotel(int id);

    List<Hotel> queryHotels();
}
