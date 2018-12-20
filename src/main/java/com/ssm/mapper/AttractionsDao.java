package com.ssm.mapper;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Attractions;

import java.util.List;

public interface AttractionsDao {


    List<Attractions> listAttractions(JSONObject jsonObject);

    Long countUsers(JSONObject jsonObject);

    int saveAttractions(Attractions attractions);

    int removeById(int aid);

    Attractions listUserById(int aid);

    int updateUser(Attractions attractions);

    List<Attractions> listALL();
}
