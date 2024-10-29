package com.fitmate.schedule.service;

import com.fitmate.schedule.dao.ScheduleDAO;
import com.fitmate.schedule.dto.ScheduleDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Service
public class ScheduleService {
	@Autowired ScheduleDAO s_dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public List<Map<String,Object>> getEvents() {
		return s_dao.getEvents();
	}

	public List<Map<String, Object>> getJournal(String date, String id) {
		List<Map<String,Object>> journal_list = s_dao.getJournal(date,id);
		return journal_list;
	}

	public Boolean schedule_write(MultipartFile[] files, String content, String id) {
		Boolean success = false;
		// ScheduleDTO

		//content부터 넣기
		//내용 idx부터....

		//content idx DTO에 저장 후 가져오기
		//만약 content insert가 다 됐으면


		//file 저장
			//새로운 이름
				//byte

				//paths






		return success;
	}
}
