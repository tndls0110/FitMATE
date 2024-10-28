package com.fitmate.admin.dao;

import com.fitmate.admin.dto.ReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportDAO {

    // 신고 목록
    List<ReportDTO> getlist();

}
