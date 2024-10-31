package com.fitmate.schedule.dao;

import com.fitmate.schedule.dto.ScheduleDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Mapper
public interface ScheduleDAO {
    List<Map<String,Object>> getEvents();
    List<Map<String, Object>> getJournal(String date, String id);


    int schedule_write(ScheduleDTO scheduleDTO);

    int filewrite(int idx, String ori_filename, String new_filename);

    List<Map<String, Object>> getCrewEvents();

    List<Map<String, Object>> crewplan_get(String date);

    List<Map<String,String>> getfile(String date,String id);

    // getfile(int idx);
}
