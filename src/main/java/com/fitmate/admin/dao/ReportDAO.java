package com.fitmate.admin.dao;

import com.fitmate.admin.dto.NoticeDTO;
import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReportDAO {

    // 신고 목록
    int allCount(int cnt);
    int countIdx();
    List<NoticeDTO> list(int limit, int offset, String opt, String keyword);

    // 신고 상세
    ReportDTO detail(String report_idx);
    List<RegReportDTO> reportStatus();
    List<ReportDTO> reportProgress(String report_idx);
    void confirmReport(Map<String, String> params);
    void updateReport(Map<String, String> params);
}
