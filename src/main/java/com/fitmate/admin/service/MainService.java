package com.fitmate.admin.service;

import com.fitmate.admin.dao.MainDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Service
public class MainService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired MainDAO main_dao;

    // 세션 체크
    String page = "";

    // layout
    public String getnick(String admin_id) {
        return main_dao.getname(admin_id);
    }

    // 로그인
    public String login(String admin_id, String pw) {
        String result = "";
        if (main_dao.login(admin_id, pw) == 1){
            result = "pass";
        } else if (main_dao.checkid(admin_id) == 0) {
            result = "invalidID";
        } else {
            result = "invalidPW";
        }
        return result;
    }
}
