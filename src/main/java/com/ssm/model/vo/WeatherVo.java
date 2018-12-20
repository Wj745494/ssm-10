package com.ssm.model.vo;

public class WeatherVo {
    private int wid;
    private String date;
    private String weather;
    private String temperature;

    @Override
    public String toString() {
        return "WeatherVo{" +
                "wid=" + wid +
                ", date='" + date +
                ", weather='" + weather +
                ", temperature=" + temperature +
                '}';
    }

    public WeatherVo() {
    }

    public int getWid() {

        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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
