package com.fitmate.admin.service;

import com.fitmate.admin.dao.RegDataDAO;
import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.admin.dto.RegReportDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RegDataService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired RegDataDAO regData_dao;

    // 지역 정보 관리
    public List<RegCountyDTO> regRegion() {
        return regData_dao.regRegion();
    }

    public void regRegion(Map<String, String> params, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
        switch (params.get("reg_type")){
            case "update":
                regData_dao.updateRegion(params);
                break;
            case "delete":
                regData_dao.deleteRegion(params);
                break;
        }
    }

    public void insertRegion(Map<String, String> params, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
        regData_dao.insertRegion(params);
    }

    public List<RegCountyDTO> regRegionSub(String region_idxS) {
        int region_idx = Integer.parseInt(region_idxS);
        return regData_dao.regRegionSub(region_idx);
    }

    public void regRegionSub(Map<String, String> params, String region_idx, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
        params.put("region_idx", region_idx);
        switch (params.get("reg_type")){
            case "update":
                regData_dao.updateRegionSub(params);
                break;
            case "delete":
                regData_dao.deleteRegionSub(params);
                break;
        }
    }

    public void insertRegionSub(Map<String, String> params, String region_idx, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
        params.put("region_idx", region_idx);
        regData_dao.insertRegionSub(params);
    }

    // 신고 사유 관리
    public List<RegReportDTO> regReport() {
        return regData_dao.regReport();
    }
    public void regReport(Map<String, String> params, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
        switch (params.get("reg_type")){
            case "update":
                regData_dao.updateReport(params);
                break;
            case "delete":
                regData_dao.deleteReport(params);
                break;
        }
    }

    public void insertReport(Map<String, String> params, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
        regData_dao.insertReport(params);
    }
}
