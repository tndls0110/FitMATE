package com.fitmate.member.dto;

import java.time.LocalDateTime;

public class MessageDTO {

    public int group_idx;
    public String member1;
    public String group_name1;
    public String member2;
    public String group_name2;

    public int message_idx;
    public String sender_id;
    public String receiver_id;
    public String msg_cont;
    public LocalDateTime sendtime;
    public int readcheck;

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
    public String getReceiver_id() {
        return receiver_id;
    }
    public String getMsg_cont() {
        return msg_cont;
    }
    public LocalDateTime getSendtime() {
        return sendtime;
    }
    public int getReadcheck() {
        return readcheck;
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
    public void setReceiver_id(String receiver_id) {
        this.receiver_id = receiver_id;
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

}
