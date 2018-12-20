package com.ssm.model;


import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * `wid` int(11) NOT NULL AUTO_INCREMENT,
 *   `date` date NOT NULL,
 *   `weather` char(10) NOT NULL,
 *   `temperature` varchar(3) NOT NULL,
 */
public class Weather {
    private int wid;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private String weather;
    private String temperature;

    @Override
    public String toString() {
        return "Weather{" +
                "wid=" + wid +
                ", date='" + date +
                ", weather='" + weather +
                ", temperature=" + temperature +
                '}';
    }

    public Weather() {
    }

    public int getWid() {

        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public void setDate(String date){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date parse=null;
        try {
            parse=new Date(simpleDateFormat.parse(date).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }finally {
            this.date=parse;
        }
    }


    public String getWeather() {
        return weather;
    }

    public void setWeather(String weather) {
        this.weather = weather;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }
}
