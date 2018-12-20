package com.ssm.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Attractions {

    private int aid;
    private String name;
    private String context;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;
    private String img;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


}
