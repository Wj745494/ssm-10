package com.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.model.Orders;
import com.ssm.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 作者:wj
 * 时间:2018/12/20
 */
@Controller
public class OrdersController {

    @Autowired
    private OrdersService os;


    //分页
    @ResponseBody
    @RequestMapping("/ordersList")
    public JSONObject listOrders(@RequestBody JSONObject jsonObject){
        jsonObject=os.listOrdersJson(jsonObject);
        return jsonObject;
    }

    //根据前台传过来的id查询该订单，用于回显
    @ResponseBody
    @RequestMapping(value = "/orders/{id}",method = RequestMethod.GET)
    public Orders getId(@PathVariable("id") int id){
      return os.getOrdersById(id);
    }


    //删除
    @ResponseBody
    @RequestMapping(value = "/orders/{id}",method = RequestMethod.POST)
    public int deleteOrders(@PathVariable("id") int id){
        int i = os.deleteOrders(id);
        return i;

    }

    //从from接收修改的信息
    @RequestMapping(value = "/ordersUpdate",method = RequestMethod.POST)
    public String updateOrders(Orders orders){
        os.updateOrders(orders);
         return "ordersList";

    }


    //从from表单提交怎加信息
    @RequestMapping(value = "/addOrders",method = RequestMethod.POST)
    public String addOrders(Orders orders){
        os.addOrders(orders);
        return "ordersList";

    }


    /**
     * 查询所有
     */

    @RequestMapping("/orderByPage")
    public String userList(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "5") Integer pageSize,Model model){
        Page<Object> objects = PageHelper.startPage(currentPage, pageSize);
        List<Orders> list = os.selectAllOrders();
        PageInfo<Orders> pageInfo = new PageInfo<>(list, 5);

        int[] nums = pageInfo.getNavigatepageNums();  //当前页
        model.addAttribute("nums", nums);
        model.addAttribute("list",list);   //查询到的总个数
        model.addAttribute("page",pageInfo);
        return "orders";

    }






}
