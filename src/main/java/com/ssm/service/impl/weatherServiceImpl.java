package com.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ssm.mapper.WeatherMapper;
import com.ssm.model.Weather;
import com.ssm.service.WeatherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class weatherServiceImpl implements WeatherService {

    @Autowired
    private WeatherMapper weatherMapper;

    @Override
    public JSONObject listWeather(JSONObject jsonObject) {
        List<Weather> list = weatherMapper.listWeather(jsonObject);
        long count = weatherMapper.getCount(jsonObject);
        if(!jsonObject.isEmpty()){
            jsonObject.clear();
        }
        jsonObject.put("total",count);
        jsonObject.put("rows",list);
        return jsonObject;
    }

    @Override
    public int removeWeather(int wid) {
        if(wid!=0){
            return weatherMapper.removeWeather(wid);
        }
        return 0;
    }

    @Override
    public int updateWeather(Weather weather) {
        return weatherMapper.updateWeather(weather);
    }

    @Override
    public int addWeather(Weather weather) {
        return weatherMapper.insertWeather(weather);
    }
}
