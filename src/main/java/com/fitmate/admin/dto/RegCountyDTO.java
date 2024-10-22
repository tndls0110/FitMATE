package com.fitmate.admin.dto;

public class RegCountyDTO {

    private int region_idx;
    private String region_name;
    private int region_show;
    private int admin_idx;

    private int regions_idx;
    private String regions_name;
    private int regions_show;

    public int getRegion_idx() {
        return region_idx;
    }
    public String getRegion_name() {
        return region_name;
    }
    public int getRegion_show() {
        return region_show;
    }
    public int getAdmin_idx() {
        return admin_idx;
    }
    public int getRegions_idx() {
        return regions_idx;
    }
    public String getRegions_name() {
        return regions_name;
    }
    public int getRegions_show() {
        return regions_show;
    }

    public void setRegion_idx(int region_idx) {
        this.region_idx = region_idx;
    }
    public void setRegion_name(String region_name) {
        this.region_name = region_name;
    }
    public void setRegion_show(int region_show) {
        this.region_show = region_show;
    }
    public void setAdmin_idx(int admin_idx) {
        this.admin_idx = admin_idx;
    }
    public void setRegions_idx(int regions_idx) {
        this.regions_idx = regions_idx;
    }
    public void setRegions_name(String regions_name) {
        this.regions_name = regions_name;
    }
    public void setRegions_show(int regions_show) {
        this.regions_show = regions_show;
    }

}
