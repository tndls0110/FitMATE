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

    public List<MessageDTO> roomList (String user_id) {
        return message_dao.roomList(user_id);
    }

    public List<MessageDTO> message (String group_idx) {
        return message_dao.message(group_idx);
    }

    public void sendMessage(Map<String, String> params, String user_id) {
        message_dao.sendMessage(params, user_id);
    }
}
