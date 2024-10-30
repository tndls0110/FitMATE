package com.fitmate.admin.dao;

import com.fitmate.admin.dto.NoticeDTO;
import com.fitmate.admin.dto.ReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportDAO {

    // 신고 목록
    int allCount(int cnt);
    int countIdx();
    List<NoticeDTO> list(int limit, int offset, String opt, String keyword);

}
