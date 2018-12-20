package com.ssm.service;

import com.alibaba.fastjson.JSONObject;
import com.ssm.model.Attractions;

import java.util.List;

public interface AttractionsService {
    JSONObject listAttractions(JSONObject jsonObject);

    int saveAttractions(Attractions attractions);

    int removeById(int aid);

    Attractions listUserById(int aid);

    int updateUser(Attractions attractions);

    List<Attractions> listALL();
}
