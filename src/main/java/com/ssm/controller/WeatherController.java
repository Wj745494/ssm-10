package com.ssm.controller;

import com.alibaba.fastjson.JSONObject;

import com.ssm.model.Weather;
import com.ssm.model.vo.WeatherVo;
import com.ssm.service.WeatherService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.RequestWrapper;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@Controller
public class WeatherController {

    @Autowired
    private WeatherService weatherService;

    @ResponseBody
    @RequestMapping(value = "/weather",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public JSONObject viewWeather(@RequestBody JSONObject jsonObject){
        /*Map<String,Object> map=new HashMap<>();
        map.put("totel",1);
        List<Object> list=new ArrayList<>();
        Map<String,Object> map1=new HashMap<>();
        map1.put("id",1);
        map1.put("name","小明");
        map1.put("price",123);
        list.add(map1);
        map.put("rows",list);*/
        jsonObject = weatherService.listWeather(jsonObject);
        return jsonObject;
    }

    /**
     * 删除
     * @param wid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/weather/{wid}",method = RequestMethod.DELETE)
    public Object removeWeather(@PathVariable(value = "wid") int wid){
        return weatherService.removeWeather(wid);
    }

    @ResponseBody
    @RequestMapping(value = "/weatherExit",method = RequestMethod.POST)
    public Object weatherExit(WeatherVo weatherVo){
        Weather weather = new Weather();
        BeanUtils.copyProperties(weatherVo,weather);
        weather.setDate(weatherVo.getDate());
        /*Weather weather = new Weather();
        weather.setWid(wid);
        weather.setDate(date);
        weather.setWeather(weather1);
        weather.setTemperature(temperature);*/
        return weatherService.updateWeather(weather);
    }

    @ResponseBody
    @RequestMapping(value = "/weatherAdd",method = RequestMethod.POST)
    public Object weatherAdd(WeatherVo weatherVo){
        Weather weather = new Weather();
        BeanUtils.copyProperties(weatherVo,weather);
        weather.setDate(weatherVo.getDate());
        /*Weather weather = new Weather();
        weather.setWid(wid);
        weather.setDate(date);
        weather.setWeather(weather1);
        weather.setTemperature(temperature);*/
        int i = weatherService.addWeather(weather);
        return i;
    }
}
