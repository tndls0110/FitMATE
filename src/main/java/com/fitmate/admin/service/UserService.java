package com.fitmate.admin.service;

import com.fitmate.admin.dao.UserDAO;
import com.fitmate.admin.dto.CrewListDTO;
import com.fitmate.member.dto.MemberDTO;
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
public class UserService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired UserDAO user_dao;

	// 사용자 목록
	public Map<String, Object> userList(int page, int cnt, String opt, String keyword, String sortType1, String sortType2) {
		int limit = cnt;
		int offset = (page - 1) * cnt;
		int totalPages = user_dao.userAllCount(cnt, opt, keyword);
		int totalIdx = user_dao.userCountIdx(opt, keyword);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalPages", totalPages);
		result.put("totalIdx", totalIdx);
		result.put("currentPage", page);
		result.put("offset", offset);
		List<MemberDTO> list = user_dao.userList(offset, limit, opt, keyword, sortType1, sortType2);
		for (MemberDTO member : list) {
			LocalDateTime cleared_date = member.getCleared_date();
			LocalDateTime now = LocalDateTime.now();
			if (cleared_date != null) {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd HH:mm");
				String clearedDate = cleared_date.format(formatter);
				if (cleared_date.isAfter(now)) {
					member.setRestrict_state(true);
					member.setCleared_date_String(clearedDate);
				} else {
					member.setRestrict_state(false);
					member.setCleared_date_String("해제");
				}
			} else {
				member.setRestrict_state(false);
				member.setCleared_date_String("없음");
			}
		}
		result.put("list", list);
		return result;
	}

	// 사용자 조회
	public MemberDTO userDetail(String user_id) {
		MemberDTO member = user_dao.userDetail(user_id);
		LocalDateTime cleared_date = member.getCleared_date();
		LocalDateTime now = LocalDateTime.now();
		if (cleared_date != null) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			String clearedDate = cleared_date.format(formatter);
			if (cleared_date.isAfter(now)) {
				member.setRestrict_state(true);
				member.setCleared_date_String(clearedDate);
			} else {
				member.setRestrict_state(false);
				member.setCleared_date_String("해제");
			}
		} else {
			member.setRestrict_state(false);
			member.setCleared_date_String("없음");
		}
		return member;
	}

	// 크루 목록
	public Map<String, Object> crewList(int page, int cnt, String opt, String keyword, String sortType) {
		int limit = cnt;
		int offset = (page - 1) * cnt;
		int totalPages = user_dao.crewAllCount(cnt, opt, keyword);
		int totalIdx = user_dao.crewCountIdx(opt, keyword);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalPages", totalPages);
		result.put("totalIdx", totalIdx);
		result.put("currentPage", page);
		result.put("offset", offset);
		result.put("list", user_dao.crewList(offset, limit, opt, keyword, sortType));
		return result;
	}

	// 크루 조회
	public CrewListDTO crewDetail(String crew_idx) {
		return user_dao.crewDetail(crew_idx);
	}
}
