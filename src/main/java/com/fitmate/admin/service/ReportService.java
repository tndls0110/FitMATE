package com.fitmate.admin.service;

import com.fitmate.admin.dao.ReportDAO;
import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
        int totalPages = report_dao.allCount(cnt, opt, keyword, sortType);
        int totalIdx = report_dao.countIdx(opt, keyword, sortType);

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
        int getCnt = report_dao.getCnt(params).size();
        if (getCnt % 3 == 0){
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime clearDate = now.plusDays(7);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            String formattedClearDate = clearDate.format(formatter);
            report_dao.restrict(params.get("reported_id"), clearDate);
            String msg = params.get("reported_id")+"님은 "+formattedClearDate+" 까지 크루 기능을 이용하실 수 없습니다. (사유: 게시글 "+getCnt+"회 차단)";
            report_dao.restrictNotify(params.get("reported_id"), msg);
        }
    }
}
