package com.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ssm.mapper.AttractionsDao;
import com.ssm.model.Attractions;
import com.ssm.service.AttractionsService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Logger;

@Service
public class AttractionsServiceImpl implements AttractionsService {

    @Autowired
    private AttractionsDao attractionsDao;
    @Override
    public JSONObject listAttractions(JSONObject jsonObject) {
        JSONObject jo = new JSONObject();
        List<Attractions> rows = attractionsDao.listAttractions(jsonObject);
        Long total = attractionsDao.countUsers(jsonObject);
        jo.put("total",total);
        jo.put("rows",rows);
        return jo;
    }

    @Override
    public int saveAttractions(Attractions attractions) {

        int i =  attractionsDao.saveAttractions(attractions);

        return i;
    }

    @Override
    public int removeById(int aid) {
       int i =  attractionsDao.removeById(aid);
        return i;
    }

    @Override
    public Attractions listUserById(int aid) {
        return attractionsDao.listUserById(aid);

    }

    @Override
    public int updateUser(Attractions attractions) {
        int i = attractionsDao.updateUser(attractions);
        return i;
    }

    @Override
    public List<Attractions> listALL() {
        List<Attractions> aions = attractionsDao.listALL();
        return aions;
    }
}
