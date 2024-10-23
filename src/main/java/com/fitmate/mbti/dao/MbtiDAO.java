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

}
