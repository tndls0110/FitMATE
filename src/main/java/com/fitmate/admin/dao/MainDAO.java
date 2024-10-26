package com.fitmate.admin.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

    // layout
    String getname(String admin_id);

    // 로그인
    int login(String admin_id, String pw);
    int checkid(String admin_id);

}
