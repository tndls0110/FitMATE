package com.fitmate.crew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewIdxDTO;
import com.fitmate.crew.dto.CrewMemberDTO;

@Mapper
public interface CrewPageDAO {

	List<ReportDTO> report_list();

	int crew_notice_write(CrewBoardDTO board_dto);

	int notice_write_crewidx(CrewIdxDTO crewidx_dto);

	List<CrewBoardDTO> crew_notice_list(int crew_idx);

	int crew_notice_del(String board_idx);

	int notice_del_crewidx(String board_idx);

	int crew_lastdate_update(int crew_idx);

	List<CrewMemberDTO> crew_member_list(int crew_idx);

	int crew_notice_noti(String member_id, int board_idx, String noti_content, String noti_url, String name);

	String notice_noti_crewname(CrewDTO crew);

	int crew_oneboard_write(CrewBoardDTO board_dto);
	
}
