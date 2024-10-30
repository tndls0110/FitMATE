package com.fitmate.admin.service;

import com.fitmate.admin.dao.ReportDAO;
import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired ReportDAO report_dao;

    // 신고 목록
    public Map<String, Object> list(int page, int cnt, String opt, String keyword) {
        int limit = cnt;
        int offset = (page - 1) * cnt;
        int totalPages = report_dao.allCount(cnt);
        int totalIdx = report_dao.countIdx();

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("totalPages", totalPages);
        result.put("totalIdx", totalIdx);
        result.put("currentPage", page);
        result.put("offset", offset);
        result.put("list", report_dao.list(limit, offset, opt, keyword));

        return result;
    }

    public ReportDTO detail(String report_idx) {
        return report_dao.detail(report_idx);
    }

    public List<RegReportDTO> reportStatus() {
        return report_dao.reportStatus();
    }

    public List<ReportDTO> reportProgress(String report_idx) {
        return report_dao.reportProgress(report_idx);
    }

    public void confirmReport(Map<String, String> params, int admin_idx) {
        params.put("admin_idx", String.valueOf(admin_idx));
        report_dao.confirmReport(params);
        report_dao.updateReport(params);
    }
}
