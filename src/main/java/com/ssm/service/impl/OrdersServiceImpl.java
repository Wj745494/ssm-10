package com.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ssm.mapper.OrdersMapper;
import com.ssm.model.Orders;
import com.ssm.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 作者:wj
 * 时间:2018/12/20
 */
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersMapper om;


    //分页
    @Override
    public JSONObject listOrdersJson(JSONObject jsonObject) {
       JSONObject jo=new JSONObject();
        List<Orders> rows = om.getListOrders(jsonObject);
        long total = om.countOrders(jsonObject);
        jo.put("rows",rows);
        jo.put("total",total);
        return jo;
    }

    //根据用户
    @Override
    public Orders getOrdersById(int id) {
        return  om.getOrdersById(id);
    }


    //删除用户
    @Override
    public int deleteOrders(int id) {
        int i = om.deleteOrders(id);
        return i;
    }


    //更新订单
    @Override
    public int updateOrders(Orders orders) {
        int i = om.updateOrders(orders);
        return i;
    }

    //增加订单
    @Override
    public int addOrders(Orders orders) {
        int i = om.addOrders(orders);
        return i;
    }

    @Override
    public List<Orders> selectAllOrders() {
        return om.queryAllOrders();
    }
}
