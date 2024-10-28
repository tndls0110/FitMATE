package com.fitmate.admin.dao;

import com.fitmate.admin.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeDAO {

    // 공지사항 작성
    int write(NoticeDTO dto);
    int insertAlert(int notice_idx);

    // 공지사항 목록
    int allCount(int cnt);
    int countIdx();
    List<NoticeDTO> list(int limit, int offset, String opt, String keyword);

    // 공지사항 삭제
    int invisible(int noticeIdx);

}
