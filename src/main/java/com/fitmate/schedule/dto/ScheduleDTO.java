package com.fitmate.schedule.dto;

import java.time.LocalDate;
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


        private int plan_idx;
        private int crew_idx;
        private LocalDate plan_date;
        private String plan_place;
        private String plan_subject;
        private String plan_content;
        private LocalTime plan_start; // 시작 시간
        private LocalTime plan_end;   // 종료 시간


    public int getPlan_idx() {
        return plan_idx;
    }

    public void setPlan_idx(int plan_idx) {
        this.plan_idx = plan_idx;
    }

    public int getCrew_idx() {
        return crew_idx;
    }

    public void setCrew_idx(int crew_idx) {
        this.crew_idx = crew_idx;
    }

    public LocalDate getPlan_date() {
        return plan_date;
    }

    public void setPlan_date(LocalDate plan_date) {
        this.plan_date = plan_date;
    }

    public String getPlan_place() {
        return plan_place;
    }

    public void setPlan_place(String plan_place) {
        this.plan_place = plan_place;
    }

    public String getPlan_subject() {
        return plan_subject;
    }

    public void setPlan_subject(String plan_subject) {
        this.plan_subject = plan_subject;
    }

    public String getPlan_content() {
        return plan_content;
    }

    public void setPlan_content(String plan_content) {
        this.plan_content = plan_content;
    }

    public LocalTime getPlan_start() {
        return plan_start;
    }

    public void setPlan_start(LocalTime plan_start) {
        this.plan_start = plan_start;
    }

    public LocalTime getPlan_end() {
        return plan_end;
    }

    public void setPlan_end(LocalTime plan_end) {
        this.plan_end = plan_end;
    }

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
