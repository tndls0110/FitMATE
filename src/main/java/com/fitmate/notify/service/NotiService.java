package com.fitmate.notify.service;

import com.fitmate.notify.dao.NotiDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NotiService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired NotiDAO n_DAO;
    public List<NotiDAO> getAllAlarm(String id, int idx) {
        logger.info("service에서 받은 idx:{}",idx);
        List<NotiDAO> list = new ArrayList<>();
        if(idx == 0){
            list = n_DAO.getAllAlarm(id);
        }else{
            list = n_DAO.getspecificAlarm(id,idx);
        }
    return list;
    }

    public boolean read_change(int idx) {
        boolean success =false;
        int updated_rows = n_DAO.read_change(idx);
        if(updated_rows>0){
            success = true;
        }
        return success;
    }

    public Object deleteAlarm(int idx) {
        int updated_rows = n_DAO.deleteAlarm(idx);
        boolean success = false;
        if(updated_rows>0){
            success = true;
        }
        return success;
    }

    public String checkUnreadAlarm(String id) {
        logger.info("서비스에서 전달받은 id :{}",id);
        String result = "none";
        int exist = n_DAO.checkUnreadAlarm(id);
        logger.info("알람 개수 :{}",exist);
        if(exist>0){
            result ="exist";
        }
        return result;
    }

    public int unread_count(String id) {
        return n_DAO.checkUnreadAlarm(id);
    }
}
