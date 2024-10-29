package com.fitmate.admin.service;

import com.fitmate.admin.dao.RegDataDAO;
import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.admin.dto.RegMBTIDTO;
import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.member.dto.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class RegDataService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired RegDataDAO regData_dao;

    // 헬스 MBTI 질문 관리
    public List<RegMBTIDTO> regMbtiQuestion() {
        return regData_dao.regMbtiQuestion();
    }

    public int insertMbtiQuestion(Map<String, String> params, int admin_idx) {
        RegMBTIDTO dto = new RegMBTIDTO();
        dto.setMbtiq_con(params.get("mbtiq_con"));
        dto.setAdmin_idx(admin_idx);
        regData_dao.insertMbtiQuestion(dto);
        return dto.getMbtiq_idx();
    }

    // 헬스 MBTI 결과 관리
    public List<RegMBTIDTO> regMbtiResult() {
        return regData_dao.regMbtiResult();
    }

    public RegMBTIDTO regMbtiResultDetail(String mbtir_idx) {
        return regData_dao.regMbtiResultDetail(mbtir_idx);
    }

    public int regMbtiResultInsert(MultipartFile[] files, Map<String, String> params, int admin_idx) {
        RegMBTIDTO dto = new RegMBTIDTO();
        dto.setMbtir_name(params.get("mbtir_name"));
        dto.setMbtir_con(params.get("mbtir_con"));
        dto.setMbtir_exc(params.get("mbtir_exc"));
        dto.setMbtir_rou(params.get("mbtir_rou"));
        dto.setAdmin_idx(admin_idx);
        if (regData_dao.insertMbtiResult(dto) == 1){
            int mbtir_idx = dto.getMbtir_idx();
            for (MultipartFile file : files) {
                if (file.getOriginalFilename().lastIndexOf(".") < 0) {
                    regData_dao.insertImg(String.valueOf(mbtir_idx), "");
                    break;
                } else {
                    try {
                        String ori_filename = file.getOriginalFilename();
                        String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
                        String new_filename = UUID.randomUUID().toString()+ext;
                        byte[] arr = file.getBytes();
                        Path path = Paths.get("C:/upload/"+new_filename);
                        Files.write(path, arr);
                        regData_dao.insertImg(String.valueOf(mbtir_idx), new_filename);
                    } catch (IOException e) {}
                }
            }
        }
        return dto.getMbtir_idx();
    }

    public void regMbtiResultDetail(MultipartFile[] files, Map<String, String> params, int admin_idx) {
        logger.info("img at service: "+files.toString());
        params.put("admin_idx", Integer.toString(admin_idx));
        logger.info("params: {}", params);
        logger.info(String.valueOf(regData_dao.updateMbtiResult(params)));
        switch (params.get("reg_type")){
            case "update":
                // 정보 입력
                if (regData_dao.updateMbtiResult(params) == 1){
                    RegMBTIDTO dto = regData_dao.regMbtiResultDetail(params.get("mbtir_idx"));
                    // 삭제 혹은 파일 변경시 기존 파일 삭제
                    if (files.length > 0) {
                        if (regData_dao.deleteImg(params.get("mbtir_idx")) == 1){
                            File file = new File("C:/upload/"+dto.getMbtir_img());
                            if (file.exists()) {
                                file.delete();
                            }
                        }
                    }

                    // 새 파일 업로드
                    logger.info("img before iterator: "+files.toString());
                    for (MultipartFile file : files) {
                        logger.info("img at iterator: "+files.toString());
                        logger.info("img at iterator: "+file);
                        if (file.getOriginalFilename().lastIndexOf(".") < 0) {
                            regData_dao.insertImg(params.get("mbtir_idx"), "");
                            break;
                        } else {
                            try {
                                String ori_filename = file.getOriginalFilename();
                                logger.info("img name at iterator: "+ori_filename);
                                String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
                                String new_filename = UUID.randomUUID().toString()+ext;
                                byte[] arr = file.getBytes();
                                Path path = Paths.get("C:/upload/"+new_filename);
                                Files.write(path, arr);
                                regData_dao.insertImg(params.get("mbtir_idx"), new_filename);
                            } catch (IOException e) {}
                        }
                    }
                }
                break;
            case "delete":
                regData_dao.deleteMbtiResult(params);
                break;
        }
    }

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

    public void regRegionSub(Map<String, String> params, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
        switch (params.get("reg_type")){
            case "update":
                regData_dao.updateRegionSub(params);
                break;
            case "delete":
                regData_dao.deleteRegionSub(params);
                break;
        }
    }

    public void insertRegionSub(Map<String, String> params, int admin_idx) {
        params.put("admin_idx", Integer.toString(admin_idx));
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
