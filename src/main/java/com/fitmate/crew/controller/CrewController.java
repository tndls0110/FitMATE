package com.fitmate.crew.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.crew.dto.CrewSearchListDTO;
import com.fitmate.crew.service.CrewService;

@Controller
public class CrewController {
   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Autowired CrewService crew_service;
      
   // 테스트 코드
   @RequestMapping(value ="/crew_create.do")
   public String crew() {
      
      return "crew_create";
   }
   


   // 1. 크루 모집글페이지
   @RequestMapping(value = "/crew_search")
   public String crewSearch(Model model) {
      // 1-1. 필터 - 지역정보/MBTI정보 가져오기
      List<Map> placeFilter = crew_service.placeFilter();
      model.addAttribute("placeFilter", placeFilter);

      List<Map> mbtiFilter = crew_service.mbtiFilter();
      model.addAttribute("mbtiFilter", mbtiFilter);

      return "crew_search";
   }

   // 2. 크루 모집글 목록조회
   @GetMapping(value = "/crew_search.ajax")
   @ResponseBody 
   public List<CrewSearchListDTO> crewSearch2( @RequestParam Map<String, String> params){
      
      logger.info("params : " + params);
      
      List<CrewSearchListDTO> recruitList = crew_service.crewList(params);
    
      return recruitList; 
   }   


@RequestMapping(value="/crew_create_rewrite.go")
public String crew_create_rewrite() {
   
   return "crew_create_rewrite";
}

@PostMapping(value="/crew_create.do" )
public String crew_create(@RequestParam String crew_id,@RequestParam String name,@RequestParam int regions_idx,@RequestParam String content) {
<<<<<<< HEAD
   
   //crew_service.crew_create(crew_id,name,regions_idx,content);
   /* 
   logger.info("crew_id {}",crew_id);
   logger.info("name {}",name);
   logger.info("regions_idx {}",regions_idx);
   logger.info("content {}",content);
   */
   return "index";
=======
	
	//crew_service.crew_create(crew_id,name,regions_idx,content);
	/* 
	logger.info("crew_id {}",crew_id);
	logger.info("name {}",name);
	logger.info("regions_idx {}",regions_idx);
	logger.info("content {}",content);
	*/
	return "index";
>>>>>>> origin/master
}

// 지역 상위 정보 가져오기
@GetMapping(value="/crew_region.ajax")
public Map<String,Object> crew_region(){
   
   
   
   return null;
}

// 지역 하위 정보 가져오기
@GetMapping(value="/crew_regions.ajax")
public Map<String,Object> crew_regions(){

   return null;
}

// 크루 모집글 수정하기
@PostMapping(value="/crew_create_rewrite.do")
public String crew_create_rewrite(@RequestParam int regions_idx,@RequestParam String content,@RequestParam int board_idx) {
<<<<<<< HEAD
    //crew_service.crew_create_rewrite(regions_idx,content,board_idx);
   
   return "index";
=======
	 //crew_service.crew_create_rewrite(regions_idx,content,board_idx);
	
	return "index";
>>>>>>> origin/master
}

}
