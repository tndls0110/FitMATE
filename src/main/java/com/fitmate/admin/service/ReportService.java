package com.fitmate.admin.service;

import com.fitmate.admin.dao.ReportDAO;
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

}
