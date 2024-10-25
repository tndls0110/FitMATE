package com.fitmate.message.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.message.dto.MessageListDTO;

@Mapper
public interface MessageDAO {

	List<MessageListDTO> getMessageList(String userId);

	String getLastMessageByGroupIdx(int groupIdx);

}
