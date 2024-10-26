package com.fitmate.admin.service;

import com.fitmate.admin.dao.NoticeDAO;
import com.fitmate.admin.dto.NoticeDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NoticeDAO notice_dao;

	// 공지사항 목록
	public Map<String, Object> list(int page, int cnt, String opt, String keyword) {
		int limit = cnt;
		int offset = (page - 1) * cnt;
		int totalPages = notice_dao.allCount(cnt);
		int totalIdx = notice_dao.countIdx();

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalPages", totalPages);
		result.put("totalIdx", totalIdx);
		result.put("currentPage", page);
		result.put("offset", offset);
		result.put("list", notice_dao.list(limit, offset, opt, keyword));

		return result;
	}

	// 공지사항 작성
	public boolean write(String notice_cont, int admin_idx) {
		boolean result = false;
		if (notice_dao.write(notice_cont, admin_idx) == 1){
			result = true;
		}
		return result;
	}
}
