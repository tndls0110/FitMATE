package com.fitmate.admin.dao;

import com.fitmate.admin.dto.CrewListDTO;
import com.fitmate.member.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserDAO {

    // 사용자 목록
    int userAllCount(int cnt);
    int userCountIdx();
    List<MemberDTO> userList(int offset, int limit, String opt, String keyword);

    // 사용자 조회
    MemberDTO userDetail(String user_id);

    // 크루 목록
    int crewAllCount(int cnt);
    int crewCountIdx();
    List<CrewListDTO> crewList(int offset, int limit, String opt, String keyword);

    // 크루 조회
    CrewListDTO crewDetail(String crew_idx);
}
