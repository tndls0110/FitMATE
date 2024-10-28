package com.fitmate.admin.dao;

import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.admin.dto.RegReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RegDataDAO {

    // 지역 정보 관리
    List<RegCountyDTO> regRegion();
    void updateRegion(Map<String, String> params);
    void deleteRegion(Map<String, String> params);
    void insertRegion(Map<String, String> params);
    List<RegCountyDTO> regRegionSub(int region_idx);
    void updateRegionSub(Map<String, String> params);
    void deleteRegionSub(Map<String, String> params);
    void insertRegionSub(Map<String, String> params);

    // 신고 사유 관리
    List<RegReportDTO> regReport();
    void updateReport(Map<String, String> params);
    void deleteReport(Map<String, String> params);
    void insertReport(Map<String, String> params);

}
