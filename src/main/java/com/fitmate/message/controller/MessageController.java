package com.fitmate.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.message.dto.MessageDTO;
import com.fitmate.message.dto.MessageListDTO;
import com.fitmate.message.service.MessageService;

@Controller
public class MessageController {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired MessageService message_service;
	
	// 메시지 목록 페이지 출현 
	@RequestMapping(value = "/message_list.go")
	public String message_list(){		
		return "message_list";
	}
	
	// 아이디값을 가져와서 자신의 메시지 목록 보여주기 
	@RequestMapping(value = "/message_list")
	public String message_List(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		List<MessageListDTO> messageList = message_service.getmessageListByUserId(userId);
		model.addAttribute("messageList" ,messageList); 
		return "message_list";
		
	}

	// 메시지 목록에서 클릭 시 메시지 페이지로 가도록 설정 
	// 그룹 idx를 모델에 담아서 특정 그룹idx로 이동하도록 설정 
	@RequestMapping(value = "/message.go")
	public String message(@RequestParam("group_idx") int group_idx, Model model) {
		model.addAttribute("group_idx", group_idx);
		List<MessageDTO> Message = message_service.getMessageByGroupIdx(group_idx);
		model.addAttribute("Message", Message);
		return "message";
	}
	
	// 선택한 메시지 페이지에서 메시지 내용 가져오기  
	@GetMapping(value = "/message.ajax")
	public List<MessageDTO> getMessages(@PathVariable int groupIdx){
		
		return message_service.getMessageByGroupIdx(groupIdx);
	}
	
// 알아봐야 할 부분 	
//	//메시지 전송 영역
//	@ResponseBody
//    @PostMapping("/message/send")
//    public String sendMessage(@RequestBody Map<String, String> messageData) {
//        String senderId = messageData.get("senderId");  // 전송자 ID
//        String receiverId = messageData.get("receiverId");  // 수신자 ID
//        String content = messageData.get("content");  // 메시지 내용
//        int groupIdx = Integer.parseInt(messageData.get("groupIdx"));
//        messageService.sendMessage(senderId, receiverId, content, groupIdx);  // 서비스에서 메시지 전송 처리
//        return "success";  // 성공 응답
//    }
}
