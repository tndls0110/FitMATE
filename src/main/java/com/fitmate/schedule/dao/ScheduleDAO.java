package com.fitmate.schedule.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface ScheduleDAO {
    List<Map<String,Object>> getEvents();
    List<Map<String, Object>> getJournal(String date);
}
