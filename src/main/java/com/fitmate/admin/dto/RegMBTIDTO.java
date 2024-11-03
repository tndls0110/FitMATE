package com.fitmate.admin.dto;

import java.util.List;

public class RegMBTIDTO {

    private int mbtiq_idx;
    private String mbtiq_con;
    private int admin_idx;

    private int mbtisub_idx;
    private String mbtisub_con;

    private List<RegMBTIDTO> regMBTIDTO;
    private int mbtiscr_idx;
    private int mbtiscr_scr;

    private int mbtir_idx;
    private String mbtir_name;
    private String mbtir_img;
    private String mbtir_con;
    private String mbtir_exc;
    private String mbtir_rou;

    private String user_id;
    private int mbtir_scrtotal;

    public int getMbtiq_idx() {
        return mbtiq_idx;
    }
    public String getMbtiq_con() {
        return mbtiq_con;
    }
    public int getAdmin_idx() {
        return admin_idx;
    }
    public int getMbtisub_idx() {
        return mbtisub_idx;
    }
    public String getMbtisub_con() {
        return mbtisub_con;
    }
    public List<RegMBTIDTO> getRegMBTIDTO() { return regMBTIDTO; }
    public int getMbtiscr_idx() {
        return mbtiscr_idx;
    }
    public int getMbtiscr_scr() {
        return mbtiscr_scr;
    }
    public int getMbtir_idx() {
        return mbtir_idx;
    }
    public String getMbtir_name() {
        return mbtir_name;
    }
    public String getMbtir_img() {
        return mbtir_img;
    }
    public String getMbtir_con() {
        return mbtir_con;
    }
    public String getMbtir_exc() {
        return mbtir_exc;
    }
    public String getMbtir_rou() {
        return mbtir_rou;
    }
    public String getUser_id() {
        return user_id;
    }
    public int getMbtir_scrtotal() {
        return mbtir_scrtotal;
    }

    public void setMbtiq_idx(int mbtiq_idx) {
        this.mbtiq_idx = mbtiq_idx;
    }
    public void setMbtiq_con(String mbtiq_con) {
        this.mbtiq_con = mbtiq_con;
    }
    public void setAdmin_idx(int admin_idx) {
        this.admin_idx = admin_idx;
    }
    public void setMbtisub_idx(int mbtisub_idx) {
        this.mbtisub_idx = mbtisub_idx;
    }
    public void setMbtisub_con(String mbtisub_con) {
        this.mbtisub_con = mbtisub_con;
    }
    public void setRegMBTIDTO(List<RegMBTIDTO> regMBTIDTO) { this.regMBTIDTO = regMBTIDTO; }
    public void setMbtiscr_idx(int mbtiscr_idx) {
        this.mbtiscr_idx = mbtiscr_idx;
    }
    public void setMbtiscr_scr(int mbtiscr_scr) {
        this.mbtiscr_scr = mbtiscr_scr;
    }
    public void setMbtir_idx(int mbtir_idx) {
        this.mbtir_idx = mbtir_idx;
    }
    public void setMbtir_name(String mbtir_name) {
        this.mbtir_name = mbtir_name;
    }
    public void setMbtir_img(String mbtir_img) {
        this.mbtir_img = mbtir_img;
    }
    public void setMbtir_con(String mbtir_con) {
        this.mbtir_con = mbtir_con;
    }
    public void setMbtir_exc(String mbtir_exc) {
        this.mbtir_exc = mbtir_exc;
    }
    public void setMbtir_rou(String mbtir_rou) {
        this.mbtir_rou = mbtir_rou;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public void setMbtir_scrtotal(int mbtir_scrtotal) {
        this.mbtir_scrtotal = mbtir_scrtotal;
    }

}
