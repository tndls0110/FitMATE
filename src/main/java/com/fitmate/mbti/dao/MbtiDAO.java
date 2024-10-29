package com.fitmate.mbti.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MbtiDAO {

	int mbtiIdx();

	Map<String, String> getQuestion(int qidx);

	List<Map<String, Object>> getOption(int qidx);

	List<Map<String, Object>> getTypeScore(int Oidx);

	int nextPageIdx(int lastQIdx);

	int questionCount();

	Map<String,String> mbtiRGet(String maxMbti);

	List<Map<String, String>> create_totalScore();

	int saveResult(String id, Map<String, Object> score);

	int checkResult(String id);

	int deleteResult(String id);

	int profileMbti(Map<String, String> max, String id);
}
