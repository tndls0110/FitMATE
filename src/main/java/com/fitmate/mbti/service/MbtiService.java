package com.fitmate.mbti.service;

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

}
