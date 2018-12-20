package com.ssm.model;

import java.sql.Date;

/**
 * 作者:wj
 * 时间:2018/12/20
 *
 */
public class Orders {
    private int id;
    private Date startime;
    private Date endtime;
    private String hotel;
    private int paymoney;

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", startime=" + startime +
                ", endtime=" + endtime +
                ", hotel='" + hotel + '\'' +
                ", paymoney=" + paymoney +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartime() {
        return startime;
    }

    public void setStartime(Date startime) {
        this.startime = startime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public int getPaymoney() {
        return paymoney;
    }

    public void setPaymoney(int paymoney) {
        this.paymoney = paymoney;
    }

    public Orders() {

    }
}
