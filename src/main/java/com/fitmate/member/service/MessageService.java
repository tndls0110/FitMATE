package com.fitmate.member.service;

import com.fitmate.member.dao.MessageDAO;
import com.fitmate.member.dto.MessageDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MessageService {
    Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired MessageDAO message_dao;

    public boolean checkPermitChat(String login_id, String group_idx) {
        boolean result = false;
        if (login_id == null) {
            login_id = "";
        }
        if (group_idx == null) {
            group_idx = "";
        }
        MessageDTO dto = message_dao.checkPermitChat(login_id, group_idx);
        if (dto != null) {
            if (dto.getMember1().equals(login_id) || dto.getMember2().equals(login_id)) {
                result = true;
            }
        }
        return result;
    }

    public List<MessageDTO> roomList (String user_id) {
        return message_dao.roomList(user_id);
    }

    public List<MessageDTO> message (String group_idx) {
        return message_dao.message(group_idx);
    }

    public void sendMessage(String group_idx, String msg_cont, String user_id) {
        message_dao.sendMessage(group_idx, msg_cont, user_id);
    }

    public int findMessageGroup(String member1, String member2) {
        int group_idx = 0;
        if (message_dao.findMessageGroupCnt(member1, member2) == 0) {
            MessageDTO dto = new MessageDTO();
            dto.setMember1(member1);
            dto.setMember2(member2);
            message_dao.createMessageGroup(dto);
            group_idx = dto.getGroup_idx();
        } else {
            group_idx = message_dao.findMessageGroup(member1, member2);
        }
        return group_idx;
    }
}
