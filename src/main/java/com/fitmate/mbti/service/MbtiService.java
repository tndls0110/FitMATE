package com.fitmate.mbti.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmate.mbti.dao.MbtiDAO;
import com.fitmate.mbti.dto.MbtiQRDTO;

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
		data.put("questionIdx", question.get("질문번호"));
		data.put("questioncontent",question.get("질문내용") );
		
		
		//★[포함 관계 정리 : data > (질문, 문항(options > option(MBTIQRDTO.option, (List<MBTIQRDTO.typescore>)]
		
		//2. 옵션 및 옵션에 대한 성향 및 점수 가져오기 -> .getOption
		//List<Map> 형태로 가져오기 -> 질문에 대한 문항은 여러개이므로
			List<Map<String, Object>> optionData = m_dao.getOption(Qidx);

			
		//List<MBTIQRDTO> options -> 여러 개인 option 모두 저장할 장소
			List<MbtiQRDTO.Option> options = new ArrayList<MbtiQRDTO.Option>(); 
			
			
			
		//옵션은 가져와서 향상 for문으로 분리
			for (Map<String, Object> option : optionData) {
				MbtiQRDTO.Option optionDTO = new MbtiQRDTO.Option();
				//MBTIQRDTO.option option에 옵션의 idx 및 내용 저장하기 
					// 표 상으로는 같은 문항 내용이 여러개 있어도 가져올 때는 자동으로 중복체크를 하기 때문에 그냥 가져와도 됨
				optionDTO.setMbtisub_idx((int)option.get("문항번호"));
				optionDTO.setMbtisub_con((String)option.get("문항내용"));
				
				
				//List <MBTIQRDTO.TypeScore> typescores 객체화 -- 한 문항에 여러 개의 성향 저장하기 위함
				List<MbtiQRDTO.TypeScore> typescores = new ArrayList<MbtiQRDTO.TypeScore>();
					
					//MBTIQRDTO.TypeScore typescore에 성향 및 점수 정보 모두 저장
					MbtiQRDTO.TypeScore typescore = new MbtiQRDTO.TypeScore();  
						typescore.setMbtir_name((String)option.get("운동성향"));
						typescore.setMbtiscr_scr((int)option.get("추가할점수"));
						//typescore, typeScores에 add하기
							typescores.add(typescore);
								//List <MBTIQRDTO.TypeScore>를 option에 넣기
							
							
								
		//option을 options에 넣기
		
		//option을 data에 추가
		
			}
		
		
		
		return data;
		
	}

}
