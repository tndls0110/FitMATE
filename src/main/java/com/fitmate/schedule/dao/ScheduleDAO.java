package com.fitmate.schedule.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Date;

@Mapper
public interface ScheduleDAO {

    Date getEvents();
}
