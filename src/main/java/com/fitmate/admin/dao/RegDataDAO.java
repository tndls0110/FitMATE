package com.fitmate.admin.dao;

import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.admin.dto.RegMBTIDTO;
import com.fitmate.admin.dto.RegReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RegDataDAO {

    // 헬스 MBTI 질문 관리
    List<RegMBTIDTO> regMbtiQuestion();
    int insertMbtiQuestion(RegMBTIDTO dto);
    List<RegMBTIDTO> regMbtisub(int mbtiq_idx);
    List<RegMBTIDTO> getMbtiQScore(int mbtisub_idx);
    int regMbtiQuestionSubInsertRow(RegMBTIDTO dto);
    int regMbtiQuestionSubInsertScr(RegMBTIDTO dto);
    int admin_regMbtiq_sub_updateQuestion(Map<String, String> params);
    int admin_regMbtiq_sub_updateScore(Map<String, String> params);
    int admin_regMbtiq_sub_deleteRow(Map<String, String> params);
    int admin_regMbtiq_sub_deleteQuestion(Map<String, String> params);
    List<RegMBTIDTO> regMbtiQuestionTrash();
    int restoreMbtiQuestion(int mbtiq_idx, int admin_idx);

    // 헬스 MBTI 결과 관리
    List<RegMBTIDTO> regMbtiResult();
    RegMBTIDTO regMbtiResultDetail(String mbtir_idx);
    int updateMbtiResult(Map<String, String> params);
    int insertMbtiResult(RegMBTIDTO dto);
    int deleteImg(String mbtir_idx);
    int insertImg(String mbtir_idx, String mbtir_img);
    int deleteMbtiResult(Map<String, String> params);
    List<RegMBTIDTO> regMbtiResultTrash();
    int restoreMbtiResult(String mbtir_idx, int admin_idx);

    // 지역 정보 관리
    List<RegCountyDTO> regRegion();
    void updateRegion(Map<String, String> params);
    void deleteRegion(Map<String, String> params);
    void insertRegion(Map<String, String> params);
    List<RegCountyDTO> regRegionTrash();
    void restoreRegion(Map<String, String> params);
    List<RegCountyDTO> regRegionSub(int region_idx);
    void updateRegionSub(Map<String, String> params);
    void deleteRegionSub(Map<String, String> params);
    void insertRegionSub(Map<String, String> params);
    List<RegCountyDTO> regRegionSubTrash(int region_idx);
    void restoreRegionSub(Map<String, String> params);

    // 신고 사유 관리
    List<RegReportDTO> regReport();
    void updateReport(Map<String, String> params);
    void deleteReport(Map<String, String> params);
    void insertReport(Map<String, String> params);
    List<RegReportDTO> regReportTrash();
    void restoreReport(Map<String, String> params);

}
