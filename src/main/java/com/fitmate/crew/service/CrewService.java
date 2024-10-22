package com.fitmate.crew.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmate.crew.dao.CrewDAO;
import com.fitmate.crew.dto.CrewSearchConditionDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;

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


	public List<CrewSearchListDTO> crewList(Map<String, String> params) {
		
		// 1. 받아온 데이터가공.
		String searchFilter_ = params.get("searchFilter");      // searchFilter [1='크루이름' / 2='크루장닉네임']
		String searchKeyword = params.get("searchKeyword");    // searchKeyword [검색키워드]
		String placeFilter_ = params.get("placeFilter");        // placeFilter [regions_idx]
		String mbtiFilter_ = params.get("mbtiFilter");          // mbtiFilter [프로필-mbtir_idx]
		
		
		CrewSearchConditionDTO searchDTO = new CrewSearchConditionDTO();
		
		int searchFilter = 0;
		int regions_idx = 0;
		int mbtiFilter = 0;
		
		if(searchFilter_ != null && !searchFilter_.equals("")) {
			searchDTO.setSearchFilter(Integer.parseInt(searchFilter_.trim())); 
		}
		if(placeFilter_ != null && !placeFilter_.equals("")) {
			searchDTO.setRegions_idx(Integer.parseInt(placeFilter_.trim()));
		}
		if(mbtiFilter_ != null && !mbtiFilter_.equals("")) {
			searchDTO.setMbtiFilter(Integer.parseInt(mbtiFilter_.trim()));
		}
		
		// Limit & Offset 세팅
		int limit = 6;
		int offset = 0;
		searchDTO.setLimit(limit);
		searchDTO.setOffset(offset);
		
		
		return crew_dao.crewList(searchDTO);
		
	} 

}
