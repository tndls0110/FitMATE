package com.fitmate.member.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MessageDTO {

    public int group_idx;
    public String member1;
    public String group_name1;
    public String member2;
    public String group_name2;

    public int message_idx;
    public String sender_id;
    public String msg_cont;
    public LocalDateTime sendtime;
    public int readcheck;

    public String member1_nick;
    public String member2_nick;

    public int getGroup_idx() {
        return group_idx;
    }
    public String getMember1() {
        return member1;
    }
    public String getGroup_name1() {
        return group_name1;
    }
    public String getMember2() {
        return member2;
    }
    public String getGroup_name2() {
        return group_name2;
    }
    public int getMessage_idx() {
        return message_idx;
    }
    public String getSender_id() {
        return sender_id;
    }
    public String getMsg_cont() {
        return msg_cont;
    }
    public String getSendtime() {
        if (sendtime == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd HH:mm");
            return sendtime.format(formatter);
        }
    }
    public int getReadcheck() {
        return readcheck;
    }
    public String getMember1_nick() {
        return member1_nick;
    }
    public String getMember2_nick() {
        return member2_nick;
    }

    public void setGroup_idx(int group_idx) {
        this.group_idx = group_idx;
    }
    public void setMember1(String member1) {
        this.member1 = member1;
    }
    public void setGroup_name1(String group_name1) {
        this.group_name1 = group_name1;
    }
    public void setMember2(String member2) {
        this.member2 = member2;
    }
    public void setGroup_name2(String group_name2) {
        this.group_name2 = group_name2;
    }
    public void setMessage_idx(int message_idx) {
        this.message_idx = message_idx;
    }
    public void setSender_id(String sender_id) {
        this.sender_id = sender_id;
    }
    public void setMsg_cont(String msg_cont) {
        this.msg_cont = msg_cont;
    }
    public void setSendtime(LocalDateTime sendtime) {
        this.sendtime = sendtime;
    }
    public void setReadcheck(int readcheck) {
        this.readcheck = readcheck;
    }
    public void setMember1_nick(String member1_nick) {
        this.member1_nick = member1_nick;
    }
    public void setMember2_nick(String member2_nick) {
        this.member2_nick = member2_nick;
    }
}
