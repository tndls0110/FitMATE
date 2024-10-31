package com.fitmate.schedule.service;

import com.fitmate.schedule.dao.ScheduleDAO;
import com.fitmate.schedule.dto.ScheduleDTO;
import com.fitmate.schedule.dto.ScheduleFileDTO;
import org.apache.tomcat.jni.File;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Key;
import java.time.LocalTime;
import java.util.*;

@Service
public class ScheduleService {
	@Autowired ScheduleDAO s_dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public Map<String,Object> getEvents() {
		Map<String,Object> event_day = new HashMap<>();
		List<Map<String,Object>> crew_events = s_dao.getCrewEvents();
		List<Map<String,Object>> date  = s_dao.getEvents();
		event_day.put("date",date);
		event_day.put("crew_events",crew_events);

		return event_day;
	}

	public Map<String,Object> getJournal(String date, String id) {
		List<Map<String,Object>> journal_list = s_dao.getJournal(date,id);

		Map<String,Object> journal_total = new HashMap<>();
		List<Map<String,String>> file = s_dao.getfile(date,id);
		journal_total.put("content",journal_list);
		journal_total.put("files",file);


		/*if(!journal_list.isEmpty()){
			//journal_list
			logger.info("journal_list:{}",journal_list);
			//그냥 가져와서 쓰면 안되나..?
			*//*Map<String,Object> idx_entry = journal_list.get(5);*//*
			*//*Set<String> key = idx_entry.keySet();
			logger.info("key:{}",key);*//*
			int idx = 0;
			//list 분리
			for(Map<String,Object> journal : journal_list){
				logger.info("journal:{}",journal);
				var keys = journal.keySet();
				for(String key : keys){
					logger.info("key:{}",key);

					if(key.equals("journal_idx")){
						idx = (int) journal.get(key);
					}
				}
			}

			logger.info("idx:{}",idx);



		}*/
		return journal_total;

	}

	public Boolean schedule_write(MultipartFile[] files, Map<String,String> content, String id) {
		logger.info("schedule_write service 도착");
		logger.info("id:{}",id);
		logger.info("content:{}",content);
		logger.info("files 길이 :{}",files.length);


		Boolean success = false;
		// ScheduleDTO
		ScheduleDTO scheduleDTO = new ScheduleDTO();
		scheduleDTO.setUser_id(id);
		scheduleDTO.setJournal_cate(Integer.parseInt(content.get("cate")));
		scheduleDTO.setJournal_content(content.get("textarea"));
		scheduleDTO.setDate(content.get("date"));
		scheduleDTO.setJournal_start(LocalTime.parse(content.get("start_time")));
		scheduleDTO.setJournal_end(LocalTime.parse(content.get("end_time")));

		//content부터 넣기
		if(s_dao.schedule_write(scheduleDTO)>0){//만약 content insert가 다 됐으면
			//content idx DTO에 저장 후 가져오기
			int idx = scheduleDTO.getJournal_idx();
			logger.info("idx:{}",idx);


			//file 저장

			//1. 파일 분리
			for(MultipartFile file : files){

				//byte
                try {
					//파일 이름
					//기존 이름
					String ori_filename = file.getOriginalFilename();
					logger.info("파일 존재 여부:{}",file.isEmpty());
					logger.info("ori_filename:{}",ori_filename);

					//만약 lastindex of가 잡히면 실행하도록
					int pos = ori_filename.lastIndexOf(".");

					//새 이름으로 바꾸기
					//확장자 뽑아오기
					if(pos>=0){ //만약에 ext가 있으면 수행하기
					String ext = ori_filename.substring(pos);
					logger.info("ext:{}",ext);


					//랜덤 이름 만들기 + 확장자
					String new_filename = UUID.randomUUID().toString() + ext;
					logger.info("new_filename:{}",new_filename);


					//byte 설정
                    byte[] arr = file.getBytes(); //바이트 추출

					//저장할 paths
					Path path = Paths.get("C:/upload/"+new_filename); //저장하려는 파일명 알아내기

					//파일에 적기(Files)
					Files.write(path,arr);//저장할 경로 , byte


					//DB에 넣기
					int updated_rows = s_dao.filewrite(idx,ori_filename,new_filename); //방금 적은 content idx에 파일 저장하기

					}

					} catch (Exception e) {
					e.printStackTrace();
				}


			}

		}
		return success;
	}

	public List<Map<String, Object>> crewplan_get(String date) {
		logger.info("컨트롤러에서 전달받은 date :{}",date);

		return s_dao.crewplan_get(date);
	}

	public void delete_journal(int idx) {
		//파일 정보 미리 저장
		/*List<ScheduleFileDTO> file = s_dao.getfile(idx);*/

		//글 삭제


		//파일 삭제



	}
}
