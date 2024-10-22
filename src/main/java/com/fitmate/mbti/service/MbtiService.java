package com.fitmate.mbti.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmate.mbti.dao.MbtiDAO;

@Service
public class MbtiService {
	@Autowired MbtiDAO m_dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	public int mbtiIdx() {
		logger.info("service 도착");
		return m_dao.mbtiIdx();
	}
	public Map<String, Object> loadQuestion(int Qidx) {
		logger.info("loadQuestion 서비스 도착");
		
		//최종 반환할 Map 객체화
		Map<String, Object> data = new HashMap<String, Object>();
		
		//각자 가져오는 쿼리는 다르게
		
		//1. 질문 가져오기 -> .getQuestion
		// Map 형태로 가져오기
		Map<String, String> question = m_dao.getQuestion(Qidx);
		
		//질문은 어차피 하나이므로 가져와서 바로 data에 저장
		
		
		
		//★[포함 관계 정리 : data > (질문, 문항(options > option(MBTIQRDTO.option, (List<MBTIQRDTO.typescore>)]
		
		//2. 옵션 및 옵션에 대한 성향 및 점수 가져오기 -> .getOption
		//List<Map> 형태로 가져오기 -> 질문에 대한 문항은 여러개이므로
			List<Map<String, Object>> optionData = m_dao.getOption(Qidx);
			
		//List<MBTIQRDTO> options -> option 모두 저장할 장소
		
		//옵션은 가져와서 향상 for문으로 분리
			
			//MBTIQRDTO.option option에 옵션의 idx 및 내용 저장하기
			
		
				//List <MBTIQRDTO.TypeScore> 객체화
						//MBTIQRDTO.TypeScore typescore에 성향 및 점수 정보 모두 저장
							//typescore, typeScores에 add하기
								
								//List <MBTIQRDTO.TypeScore>를 option에 넣기
			
		//option을 options에 넣기
		
		//option을 data에 추가
		
		
		
		
		
		return data;
		
	}

}
