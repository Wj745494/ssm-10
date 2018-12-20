package com.ssm.mapper;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Orders;

import java.util.List;

/**
 * 作者:wj
 * 时间:2018/12/20
 */
public interface OrdersMapper {

    /**
     * 查询分页
     */
    List<Orders> getListOrders(JSONObject jsonObject);

    /**
     * 查询总条数
     */
    long countOrders(JSONObject jsonObject);

    /**
     * 根据id查询订单
     */
    Orders getOrdersById(int id);


    /**
     * 删除订单
     */
    int deleteOrders(int id);


    /**
     * 修改用户
     */

    int updateOrders(Orders orders);

    /**
     * 增加订单
     */
    int addOrders(Orders orders);


    /**
     * 用户订单查询所有,及分页
     */
    List<Orders> queryAllOrders();


}
