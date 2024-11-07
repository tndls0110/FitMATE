package com.fitmate.member.dao;

import com.fitmate.member.dto.MessageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MessageDAO {

    List<MessageDTO> roomList(String user_id);
    List<MessageDTO> message(String group_idx);
    void sendMessage(Map<String, String> params, String user_id);

}
