package com.fitmate.admin.dao;

import com.fitmate.member.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserDAO {

    // 사용자 목록
    int userAllCount(int cnt);
    int userCountIdx();
    List<MemberDTO> userList(int offset, int limit, String opt, String keyword);

}
