package com.fitmate.member.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

    // 유저 로그인
    int login(String user_id, String pw);
    int checkid(String user_id);
    int checknick(String nick);

}
