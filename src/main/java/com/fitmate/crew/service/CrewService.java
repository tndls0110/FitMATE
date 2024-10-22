package com.fitmate.crew.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmate.crew.dao.CrewDAO;

@Service
public class CrewService {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired CrewDAO crew_dao;
	
	// placeFilter목록 가져오기
	public List<Map> placeFilter() {
		return crew_dao.placeFilter();
	}
	
	// mbtiFilter목록 가져오기
	public List<Map> mbtiFilter() {
		return crew_dao.mbtiFilter();
	}



	public List<Map> crewList(Map<String, String> params) {
		
		// 1. 받아온 데이터가공.
		String searchFilter_ = params.get("searchFilter");      // searchFilter [1='크루이름' / 2='크루장닉네임']
		String searchKeyword = params.get("searchKeyword");    // searchKeyword [검색키워드]
		String placeFilter_ = params.get("placeFilter");        // placeFilter [region_idx, regions_idx를 분리]
		String mbtiFilter_ = params.get("mbtiFilter");          // mbtiFilter [프로필-mbtir_idx]
		
		
		int searchFilter = 0;
		int region_idx = 0;
		int regions_idx = 0;
		int mbtiFilter = 0;
		
		if(searchFilter_ != null && !searchFilter_.equals("")) {
			searchFilter = Integer.parseInt(searchFilter_); 
		}
		if(placeFilter_ != null && !placeFilter_.equals("")) {
			 String[] place = placeFilter_.split("_"); region_idx =
			 Integer.parseInt(place[0]); regions_idx = Integer.parseInt(place[1]);
		}
		if(mbtiFilter_ != null && !mbtiFilter_.equals("")) {
			mbtiFilter = Integer.parseInt(mbtiFilter_); 
		}
		
		
		// Limit & Offset 세팅
		int limit = 6;
		int offset = 0;
		
		
		return crew_dao.crewList(searchFilter, searchKeyword, region_idx, regions_idx, mbtiFilter, limit, offset);
		
	} 

}
