package com.fitmate.admin.service;

import com.fitmate.admin.dao.MainDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired MainDAO main_DAO;

    // 로그인
    public String login(String userId, String pw) {
        return "";
    }
}
