package com.ssm.service;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Orders;

import java.util.List;

/**
 * 作者:wj
 * 时间:2018/12/20
 */
public interface OrdersService {
    //用户分页
    JSONObject listOrdersJson(JSONObject jsonObject);

    //根据id进行查询
    Orders getOrdersById(int id);

    //删除订单
    int deleteOrders(int id);

    //修改订单
    int updateOrders(Orders orders);

    //增加订单
    int addOrders(Orders orders);


    /**
     * 查询所有
     */
    List<Orders> selectAllOrders();

}
