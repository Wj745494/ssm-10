package com.ssm.controller;

import com.alibaba.fastjson.JSONObject;

import com.ssm.model.Weather;
import com.ssm.model.vo.WeatherVo;
import com.ssm.service.WeatherService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.RequestWrapper;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;


@Controller
public class WeatherController {

    @Autowired
    private WeatherService weatherService;

    @RequestMapping("toWeather")
    public String toWeatherInfo(Model model){
        List<Weather> list = weatherService.viewWeather();
        model.addAttribute("list",list);
        return "weatherInfo";
    }

    @ResponseBody
    @RequestMapping(value = "/weather",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public JSONObject viewWeather(@RequestBody JSONObject jsonObject){
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
        return weatherService.updateWeather(weather);
    }

    @ResponseBody
    @RequestMapping(value = "/weatherAdd",method = RequestMethod.POST)
    public Object weatherAdd(WeatherVo weatherVo){
        Weather weather = new Weather();
        BeanUtils.copyProperties(weatherVo,weather);
        weather.setDate(weatherVo.getDate());
        int i = weatherService.addWeather(weather);
        return i;
    }
}
