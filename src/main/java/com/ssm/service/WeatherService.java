package com.ssm.service;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Weather;

import java.util.List;

public interface WeatherService {
    JSONObject listWeather(JSONObject jsonObject);

    /**
     * 根据id删除weather
     * @param wid
     * @return
     */
    int removeWeather(int wid);

    /**
     * 修改数据
     * @param weather
     * @return
     */
    int updateWeather(Weather weather);

    /**
     * 新增数据
     * @param weather
     * @return
     */
    int addWeather(Weather weather);

    /**
     * 查询
     * @return
     */
    List<Weather> viewWeather();
}
