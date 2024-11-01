package com.fitmate.crew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewFileDTO;
import com.fitmate.crew.dto.CrewIdxDTO;
import com.fitmate.crew.dto.CrewMemberDTO;
import com.fitmate.crew.dto.CrewMemberProfileDTO;
import com.fitmate.member.dto.MemberDTO;

@Mapper
public interface CrewPageDAO {

	List<RegReportDTO> report_list();

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

	List<CrewBoardDTO> crew_oneboard_list(int crew_idx);

	int crew_oneboard_blind(String board_idx);

	int crew_oneboard_unblind(String board_idx);

	int photofile_write(int board_idx, String ori_filename, String new_filename);

	int crew_photo_write(CrewBoardDTO board_dto);

	CrewBoardDTO crew_photo_detail(String board_idx);

	CrewFileDTO crew_photo(String board_idx);

	MemberDTO crew_getprofile(MemberDTO member_dto);

	int crew_photofile_del(String board_idx);

	String board_reported_id(String board_idx);

	int report_do(ReportDTO report_dto);

	CrewBoardDTO crew_main_notice(int crew_idx);

	List<CrewMemberProfileDTO> crew_main_crewmember(int crew_idx);

	
	
}
