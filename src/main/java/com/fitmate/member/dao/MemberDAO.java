package com.fitmate.member.dao;

import com.fitmate.admin.dto.RegCountyDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberDAO {

    // 유저 로그인
    int login(String user_id, String pw);
    int checkid(String user_id);

    // 회원 가입
    List<RegCountyDTO> getRegion();
    int checknick(String nick);
    List<RegCountyDTO> getRegion2(String regionIdx);

}
