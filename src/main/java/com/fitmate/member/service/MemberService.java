package com.fitmate.member.service;

import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.member.dao.MemberDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberDAO member_dao;

	// 유저 로그인
	public String login(String user_id, String pw) {
		String result = "";
		if (member_dao.login(user_id, pw) == 1){
			result = "pass";
		} else if (member_dao.checkid(user_id) == 0) {
			result = "invalidID";
		} else {
			result = "invalidPW";
		}
		return result;
	}

	// 회원 가입
	public List<RegCountyDTO> getRegion() {
		return member_dao.getRegion();
	}

	public boolean checkid(String user_id) {
		boolean result = false;
		if (member_dao.checkid(user_id) == 0 && user_id != null) {
			result = true;
		}
		return result;
	}

	public boolean checknick(String nick) {
		boolean result = false;
		if (member_dao.checknick(nick) == 0 && nick != null) {
			result = true;
		}
		return result;
	}

	public List<RegCountyDTO> getRegion2(String region_idx) {
		return member_dao.getRegion2(region_idx);
	}
}
