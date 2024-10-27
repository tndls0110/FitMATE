package com.fitmate.admin.service;

import com.fitmate.admin.dao.UserDAO;
import com.fitmate.member.dto.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired UserDAO user_dao;

	// 사용자 목록
	public Map<String, Object> userList(int page, int cnt, String opt, String keyword) {
		int limit = cnt;
		int offset = (page - 1) * cnt;
		int totalPages = user_dao.userAllCount(cnt);
		int totalIdx = user_dao.userCountIdx();

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalPages", totalPages);
		result.put("totalIdx", totalIdx);
		result.put("currentPage", page);
		result.put("offset", offset);
		result.put("list", user_dao.userList(offset, limit, opt, keyword));
		return result;
	}

	// 사용자 조회
	public MemberDTO userDetail(String user_id) {
		return user_dao.userDetail(user_id);
	}

	// 크루 목록
	public Map<String, Object> crewList(int page, int cnt, String opt, String keyword) {
		int limit = cnt;
		int offset = (page - 1) * cnt;
		int totalPages = user_dao.crewAllCount(cnt);
		int totalIdx = user_dao.crewCountIdx();

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalPages", totalPages);
		result.put("totalIdx", totalIdx);
		result.put("currentPage", page);
		result.put("offset", offset);
		result.put("list", user_dao.crewList(offset, limit, opt, keyword));
		return result;
	}
}
