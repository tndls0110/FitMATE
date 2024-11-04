package com.fitmate.notify.dto;

import java.util.Date;

public class NotiDTO {
    private int noti_idx;
    private String notir_id;
    private int notis_idx;
    private int notis_cate;
    private String noti_content;
    private Date notis_date;
    private int notis_check;
    private String noti_url;

    public int getNoti_idx() {
        return noti_idx;
    }

    public void setNoti_idx(int noti_idx) {
        this.noti_idx = noti_idx;
    }

    public String getNotir_id() {
        return notir_id;
    }

    public void setNotir_id(String notir_id) {
        this.notir_id = notir_id;
    }

    public int getNotis_idx() {
        return notis_idx;
    }

    public void setNotis_idx(int notis_idx) {
        this.notis_idx = notis_idx;
    }

    public int getNotis_cate() {
        return notis_cate;
    }

    public void setNotis_cate(int notis_cate) {
        this.notis_cate = notis_cate;
    }

    public String getNoti_content() {
        return noti_content;
    }

    public void setNoti_content(String noti_content) {
        this.noti_content = noti_content;
    }

    public Date getNotis_date() {
        return notis_date;
    }

    public void setNotis_date(Date notis_date) {
        this.notis_date = notis_date;
    }

    public int getNotis_check() {
        return notis_check;
    }

    public void setNotis_check(int notis_check) {
        this.notis_check = notis_check;
    }

    public String getNoti_url() {
        return noti_url;
    }

    public void setNoti_url(String noti_url) {
        this.noti_url = noti_url;
    }
}
