package com.fitmate.notify.dao;

import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface NotiDAO {
    List<NotiDAO> getAllAlarm(String id);

    List<NotiDAO> getspecificAlarm(String id, int idx);

    int read_change(int idx);

    int deleteAlarm(int idx);

    int auto_delete(LocalDate thirtyDaysAgo);

    int checkUnreadAlarm(String id);
}
