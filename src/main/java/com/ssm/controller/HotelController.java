package com.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Hotel;
import com.ssm.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class HotelController {

    @Autowired
    private HotelService hotelService;

    //查询分页
    @ResponseBody
    @RequestMapping("/hotelByPage")
    public JSONObject listHotels(@RequestBody JSONObject jsonObject){
        jsonObject=hotelService.listHotelJson(jsonObject);
        return jsonObject;
    }

    //根据id查询用户
    @ResponseBody
    @RequestMapping(value = "/hotel/{id}",method = RequestMethod.GET)
    public Hotel getHotelById(@PathVariable("id") int id){
        return hotelService.selectHotelById(id);
    }



    //增加用户
    @RequestMapping(value = "/addHotel",method = RequestMethod.POST)
    public String  addHotel(Hotel hotel){
        hotelService.addHotel(hotel);
        return "hotellist";
    }





    //删除用户
    @ResponseBody
    @RequestMapping(value = "/hotel/{id}",method = RequestMethod.POST)
    public int deleteHotel(@PathVariable("id") int id){
        return hotelService.deleteHotel(id);
    }


    //从from接收过来真正的修改信息
    @RequestMapping(value = "/hotelUpdate",method = RequestMethod.POST)
    public String  update(Hotel hotel){
      hotelService.updateHotel(hotel);
        return "hotellist";
    }

   @RequestMapping(value ="/queryHotel")
   public String queryHotel(Model model){
        List<Hotel> list=hotelService.queryHotels();
       model.addAttribute("list",list);


        return "hotel";
   }




}

