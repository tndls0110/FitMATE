package com.fitmate.schedule.dao;

import com.fitmate.schedule.dto.ScheduleDTO;
import com.fitmate.schedule.dto.ScheduleFileDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Mapper
public interface ScheduleDAO {
    List<Map<String,Object>> getEvents(String id);
    List<Map<String, Object>> getJournal(String date, String id);


    int schedule_write(ScheduleDTO scheduleDTO);

    int filewrite(int idx, String ori_filename, String new_filename);

    List<Map<String, Object>> getCrewEvents(String id);

    List<Map<String, Object>> crewplan_get(String date, String id);

    List<Map<String,String>> getfile(String date,String id);

    int delete(int idx);

    List<ScheduleFileDTO> getcurrentfile(int idx);

    int deleteContent(int idx);

    int check_file(int idx);

    List<Map<String, Object>> getJournal_detail(int idx);

    // getfile(int idx);
}
