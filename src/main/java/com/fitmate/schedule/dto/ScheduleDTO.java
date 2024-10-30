package com.fitmate.schedule.dto;

import java.time.LocalTime;

public class ScheduleDTO {
    //스케줄 DTO에 필요한 것..
        //journal_idx
        private int journal_idx;

        //user_id
        private String user_id;

        //journal_cate
        private int journal_cate;

        //journal_content
        private String journal_content;

        //date
        private String date;

        //journal_start
        private LocalTime journal_start;

        //journal_end
        private LocalTime journal_end;

    public int getJournal_idx() {
        return journal_idx;
    }

    public void setJournal_idx(int journal_idx) {
        this.journal_idx = journal_idx;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getJournal_cate() {
        return journal_cate;
    }

    public void setJournal_cate(int journal_cate) {
        this.journal_cate = journal_cate;
    }

    public String getJournal_content() {
        return journal_content;
    }

    public void setJournal_content(String journal_content) {
        this.journal_content = journal_content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public LocalTime getJournal_start() {
        return journal_start;
    }

    public void setJournal_start(LocalTime journal_start) {
        this.journal_start = journal_start;
    }

    public LocalTime getJournal_end() {
        return journal_end;
    }

    public void setJournal_end(LocalTime journal_end) {
        this.journal_end = journal_end;
    }
}
