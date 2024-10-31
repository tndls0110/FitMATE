package com.fitmate.schedule.dto;

public class ScheduleFileDTO {
    private int file_idx;
    private int category_idx;
    private String ori_filename;
    private String new_filename;
    private int board_idx;
    private String file_type;

    public int getFile_idx() {
        return file_idx;
    }

    public void setFile_idx(int file_idx) {
        this.file_idx = file_idx;
    }

    public int getCategory_idx() {
        return category_idx;
    }

    public void setCategory_idx(int category_idx) {
        this.category_idx = category_idx;
    }

    public String getOri_filename() {
        return ori_filename;
    }

    public void setOri_filename(String ori_filename) {
        this.ori_filename = ori_filename;
    }

    public String getNew_filename() {
        return new_filename;
    }

    public void setNew_filename(String new_filename) {
        this.new_filename = new_filename;
    }

    public int getBoard_idx() {
        return board_idx;
    }

    public void setBoard_idx(int board_idx) {
        this.board_idx = board_idx;
    }

    public String getFile_type() {
        return file_type;
    }

    public void setFile_type(String file_type) {
        this.file_type = file_type;
    }
}
