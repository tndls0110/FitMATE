package com.fitmate.admin.dao;

import com.fitmate.admin.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface NoticeDAO {

    // 공지사항 목록
    int allCount(int cnt);
    int countIdx();
    List<NoticeDTO> list(int limit, int offset, String opt, String keyword);

    // 공지사항 작성
    int write(String notice_cont, int admin_idx);

}
