package com.ssm.mapper;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Weather;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WeatherMapper {

    List<Weather> listWeather(JSONObject jsonObject);

    long getCount(JSONObject jsonObject);

    /**
     * 根据删除weather行数据
     * @param wid
     * @return
     */
    int removeWeather(int wid);

    /**
     * 更新weather
     * @param weather
     * @return
     */
    int updateWeather(Weather weather);

    /**
     * 新增数据
     * @param weather
     * @return
     */
    int insertWeather(Weather weather);

    /**
     * 查询
     * @return
     */
    List<Weather> viewWeather();
}
