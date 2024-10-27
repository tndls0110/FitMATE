package com.fitmate.admin.dao;

import com.fitmate.admin.dto.RegReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RegDataDAO {

    // 신고 사유 관리
    List<RegReportDTO> regReport();

}
