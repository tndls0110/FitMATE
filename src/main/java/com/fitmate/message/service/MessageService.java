package com.fitmate.message.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmate.message.dao.MessageDAO;
import com.fitmate.message.dto.MessageDTO;
import com.fitmate.message.dto.MessageListDTO;

@Service
public class MessageService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MessageDAO message_dao;

	// 회원의 채팅방 목록 가져오기 
	public List<MessageListDTO> getmessageListByUserId(String userId) {
		
		//DB에서 채팅방목록을 가져오도록 하기
		List<MessageListDTO> messagelist = message_dao.getMessageList(userId);
		for (int i = 0; i < messagelist.size(); i++) {
		    MessageListDTO messageListDTO = messagelist.get(i);  // 리스트에서 현재 인덱스의 요소를 가져옵니다.
		    String lastMessage = message_dao.getLastMessageByGroupIdx(messageListDTO.getGroupIdx());  // 마지막 메시지를 가져옵니다.
		    messageListDTO.setLastMessage(lastMessage);  // 가져온 메시지를 설정합니다.
		}
		
		return messagelist;
	}

	public List<MessageDTO> getMessageByGroupIdx(int group_idx) {
		
		return null;
	}


}
