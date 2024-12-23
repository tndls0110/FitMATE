package com.fitmate.member.dao;

import com.fitmate.member.dto.MessageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageDAO {
    MessageDTO checkPermitChat(String login_id, String group_idx);
    List<MessageDTO> roomList(String user_id);
    List<MessageDTO> message(String group_idx);
    void sendMessage(String group_idx, String msg_cont, String user_id);
    int findMessageGroupCnt(String member1, String member2);
    int createMessageGroup(MessageDTO dto);
    int findMessageGroup(String member1, String member2);
}
