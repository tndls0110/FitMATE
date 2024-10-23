package com.fitmate.mbti.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	@Autowired
	MbtiDAO m_dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public int mbtiIdx() {
		logger.info("service 도착");
		return m_dao.mbtiIdx();
	}

	public Map<String, Object> loadQuestion(int Qidx) {
		logger.info("loadQuestion 서비스 도착");

// =======================================================================================
		// ★[포함 관계 정리 : data > (질문, 문항(options > option(MBTIQRDTO.option,
		// (List<MBTIQRDTO.typescore>)]
		// 최종 반환할 Map 객체화
// =======================================================================================

		Map<String, Object> data = new HashMap<String, Object>();
		// 각자 가져오는 쿼리는 다르게
// =======================================================================================
		// 1번 함수. 질문 가져오기 -> .getQuestion
		// Map 형태로 가져오기
		Map<String, String> question = m_dao.getQuestion(Qidx);

		// 질문은 어차피 하나이므로 가져와서 바로 data에 저장
		data.put("questionIdx", question.get("질문번호"));
		data.put("questioncontent", question.get("질문내용"));

		return data;
	}

	public Map<String, Object> loadOption(int Qidx) {
		Map<String, Object> data = new HashMap<String, Object>(); //되돌려줄 map 형태 생성
// =======================================================================================
		// 2번 함수. 옵션 및 옵션에 대한 성향 및 점수 가져오기 -> .getOption
		// List<Map> 형태로 가져오기 -> 질문에 대한 문항은 여러개이므로
		List<Map<String, Object>> optionData = m_dao.getOption(Qidx);
		logger.info("전달하는 Qidx 값 :{}", Qidx);

		// List<MBTIQRDTO> options -> 여러 개인 option 모두 저장할 장소
		List<MbtiQRDTO.Option> options = new ArrayList<MbtiQRDTO.Option>();

		// 옵션은 가져와서 향상 for문으로 분리
		for (Map<String, Object> option : optionData) {
			MbtiQRDTO.Option optionDTO = new MbtiQRDTO.Option();
			// MBTIQRDTO.option option에 옵션의 idx 및 내용 저장하기
			// 표 상으로는 같은 문항 내용이 여러개 있어도 가져올 때는 자동으로 중복체크를 하기 때문에 그냥 가져와도 됨
			int optionIdx = (int) option.get("문항번호"); // 문항번호는 성향과 점수 조회를 위해서 다시 써야하니까..
			optionDTO.setMbtisub_idx(optionIdx);
			optionDTO.setMbtisub_con((String) option.get("문항내용"));
// =======================================================================================
			// optionDTO를 options에 저장 (-> 하나의 option 완성 -> options List로 저장)
			options.add(optionDTO);
			// 완성한 options를 data에 추가
			data.put("option", options);
		}
		return data;
	}

	public Map<String, Object> getTypeScore(int Oidx) {
		logger.info("getTypeScore 서비스 도착");
		logger.info("getTypeScore 서비스에서 전달받은 idx 값 : ", Oidx);
		//최종 저장할 곳
		Map<String, Object> data = new HashMap<>();

		//List<
		List<Map<String, Object>> typeScoreData = m_dao.getTypeScore(Oidx);

		// List <MBTIQRDTO.TypeScore> typescores 객체화 -- 한 문항에 여러 개의 성향 저장하기 위함
		List<MbtiQRDTO.TypeScore> typescores = new ArrayList<MbtiQRDTO.TypeScore>();

		//꺼내온 typeScore을 for문으로 분리
		for (Map<String, Object> typeScore : typeScoreData) {

			String mbtir_name = (String) typeScore.get("운동성향");
			int mbtiscr_scr = (int) typeScore.get("추가할점수");

			logger.info("성향 이름: {}, 점수: {}", mbtir_name, mbtiscr_scr);
//================================================================================================
			// ★문제 발생 -> 질문 / 문항 / 성향과 점수를 한번에 조회하니까 전달 받을 성향과 점수가 5개인데...
			// 성향과 점수가 하나씩 밖에 조회가 안됨
			// 해결 방법 : 문항 idx를 기반으로 성향과 점수를 한번 더 조회하기
//================================================================================================

			// MBTIQRDTO.TypeScore typescore에 성향 및 점수 정보 모두 저장
			MbtiQRDTO.TypeScore typescore = new MbtiQRDTO.TypeScore();
			typescore.setMbtir_name(mbtir_name);
			typescore.setMbtiscr_scr(mbtiscr_scr);

			typescores.add(typescore);// typescore, typeScores에 add하기
			data.put("typeScore", typescores);

		}
		return data;
	}

}