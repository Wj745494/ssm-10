package com.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Attractions;
import com.ssm.service.AttractionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AttractionsAction {

    @Autowired
    private AttractionsService attractionsService;
    @RequestMapping(value = "/{path}",method = RequestMethod.GET)
    public String toPage(@PathVariable String path){
        return path;
    }
    @ResponseBody
    @RequestMapping(value = "/attractions",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public Object showAllAttractions(@RequestBody JSONObject jsonObject){
        jsonObject=attractionsService.listAttractions(jsonObject);
        //System.out.println(jsonObject);
        return jsonObject;
    }
    @ResponseBody
    @RequestMapping(value = "/addAion",method = RequestMethod.POST)
    public int addAttractions(Attractions attractions){
        int i = attractionsService.saveAttractions(attractions);
        System.out.println(i);
        return i;
    }
    @ResponseBody
    @RequestMapping(value = "/addAion/{aid}",method = RequestMethod.DELETE)
    public int delete(@PathVariable int aid){
        int i =attractionsService.removeById(aid);
        return i;
    }
    @ResponseBody
    @RequestMapping(value = "/addAion/{aid}",method = RequestMethod.GET)
    public Attractions select(@PathVariable int aid){
        return attractionsService.listUserById(aid);
    }
    @ResponseBody
    @RequestMapping(value = "/addAion",method = RequestMethod.PUT)
    public int update(Attractions attractions){
        //System.out.println(attractions);
        int i =  attractionsService.updateUser(attractions);
        return i;
    }
    @RequestMapping(value = "/showList",method = RequestMethod.GET)
    public String listAttractions(Model model){
       List<Attractions> aions =  attractionsService.listALL();
       model.addAttribute("aions",aions);
        return "holle";
    }
}
