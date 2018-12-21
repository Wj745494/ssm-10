package com.ssm.mapper;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Hotel;

import java.util.List;


/**
 * 作者:wj
 * 时间:2018/12/17
 */
public interface HotelMapper {

    /**
     * 根据id查询用户
     *
     */
    Hotel getHotelById(int id);



    /**
     * 增加用户
     */
    int addHotel(Hotel hotel);



    /**
     *
     * 删除用户
     */
   int deleteHotel(int id);


    /**
     * 修改用户
     */
    int updateHotel(Hotel hotel);


    /**
     *
     * 查询所有分页
     */
    List<Hotel> listHotels(JSONObject jsonObject);


    /**
     *
     * 查询总条数
     */
    long countHotels(JSONObject jsonObject);


    List<Hotel> queryHotels();
}
