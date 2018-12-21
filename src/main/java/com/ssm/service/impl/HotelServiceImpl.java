package com.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ssm.mapper.HotelMapper;
import com.ssm.model.Hotel;
import com.ssm.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 作者:wj
 * 时间:2018/12/18
 */
@Service
public class HotelServiceImpl implements HotelService {


    @Autowired
    private HotelMapper hotelMapper;

    @Override
    public JSONObject listHotelJson(JSONObject jsonObject) {
        //服务器必须返回rows,total
        List<Hotel> rows = hotelMapper.listHotels(jsonObject);
        long total= hotelMapper.countHotels(jsonObject);
        JSONObject jo=new JSONObject();
        jo.put("rows",rows);
        jo.put("total",total);
        return jo;
    }

    @Override
    public Hotel selectHotelById(int id) {
        return hotelMapper.getHotelById(id);
    }

    @Override
    public int deleteHotel(int id) {
        return hotelMapper.deleteHotel(id);

    }

    @Override
    public List<Hotel> queryHotels() {
        return hotelMapper.queryHotels();
    }

    @Override
    public int addHotel(Hotel hotel) {
        return hotelMapper.addHotel(hotel);

    }

    @Override
    public int updateHotel(Hotel hotel) {
        return hotelMapper.updateHotel(hotel);

    }
}
