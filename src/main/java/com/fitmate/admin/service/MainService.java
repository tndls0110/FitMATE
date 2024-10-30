package com.fitmate.admin.service;

import com.fitmate.admin.dao.MainDAO;
import com.fitmate.admin.dto.DashboardDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired MainDAO main_dao;

    // 세션 체크
    String page = "";

    // layout
    public String getnick(int admin_idx) {
        return main_dao.getname(admin_idx);
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
    public int getidx(String admin_id) {
        return main_dao.getidx(admin_id);
    }

    // 대시보드 > 공지사항 목록
    public List<DashboardDTO> dashboardList1() {
        return main_dao.dashboardList1();
    }

    // 대시보드 > 신고 목록
    public List<DashboardDTO> dashboardList2() {
        return main_dao.dashboardList2();
    }
}
