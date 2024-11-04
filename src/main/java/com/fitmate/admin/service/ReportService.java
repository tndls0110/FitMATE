package com.fitmate.admin.service;

import com.fitmate.admin.dao.ReportDAO;
import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired ReportDAO report_dao;

    // 신고 목록
    public Map<String, Object> list(int page, int cnt, String opt, String keyword, String sortType) {
        int limit = cnt;
        int offset = (page - 1) * cnt;
        int totalPages = report_dao.allCount(cnt);
        int totalIdx = report_dao.countIdx();

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("totalPages", totalPages);
        result.put("totalIdx", totalIdx);
        result.put("currentPage", page);
        result.put("offset", offset);
        result.put("list", report_dao.list(limit, offset, opt, keyword, sortType));

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
        List<String> list = report_dao.getSameReport(params.get("board_idx"), params.get("reportr_idx"));
        for (String report : list) {
            params.put("report_idx", report);
            report_dao.confirmReport(params);
            report_dao.updateReport(params);
            if (params.get("report_prog").equals("3")) {
                report_dao.blind(params);
            }
        }
        if (report_dao.getCnt(params).size() % 3 == 0){
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime clearDate = now.plusDays(7);
            report_dao.restrict(params.get("reported_id"), clearDate);
        }
    }
}
