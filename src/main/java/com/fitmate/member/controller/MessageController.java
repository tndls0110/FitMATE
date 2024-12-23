package com.fitmate.member.controller;

import com.fitmate.member.service.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MessageController {
    Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired MessageService message_service;

    // 세션 체크
    String page = "";
    public void checkPermit(String addr, Model model, HttpSession session) {
        String loginId = (String) session.getAttribute("loginId");
        if (loginId == null) {
            model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
            if (addr.equals("") || addr == null) {
                model.addAttribute("addr", "redirect:/schedule.go");
            } else {
                model.addAttribute("addr", addr);
            }
            page = "member_login";
        }
    }

    @RequestMapping (value = "/member_message.go")
    public String message (Model model, HttpSession session) {
        page = "member_message";
        checkPermit("redirect:/member_message.go", model, session);
        return page;
    }

    @RequestMapping (value = "/member_messageList.go")
    public String message (String group_idx, Model model, HttpSession session) {
        page = "member_message";
        checkPermit("redirect:/member_messageList.go?group_idx="+group_idx, model, session);
        String login_id = (String) session.getAttribute("loginId");
        boolean permit = message_service.checkPermitChat(login_id, group_idx);
        if (login_id == null || login_id.isEmpty()) {
            model.addAttribute("msg", "로그인하세요.");
        } else if (group_idx == null || group_idx.isEmpty() || group_idx.equals("null")) {
            // 메시지 그룹을 선택하도록 유도함
        } else if (!permit) {
            model.addAttribute("msg", "잘못된 접근입니다.");
        }
        return page;
    }

    @RequestMapping (value = "/member_messageGroup.ajax")
    @ResponseBody
    public Map<String, Object> message (HttpSession session) {
        Map<String, Object> list = new HashMap<String, Object>();
        String user_id = (String) session.getAttribute("loginId");
        list.put("roomList", message_service.roomList(user_id));
        return list;
    }

    @RequestMapping (value = "/member_messageList.ajax")
    @ResponseBody
    public Map<String, Object> message (String group_idx, HttpSession session) {
        Map<String, Object> list = new HashMap<String, Object>();
        if (!message_service.checkPermitChat((String) session.getAttribute("loginId"), group_idx)){
            list.put("msg", "접근 권한이 없습니다.");
        } else {
            list.put("messageList", message_service.message(group_idx));
        }
        return list;
    }

    @RequestMapping (value = "/member_sendMessage.ajax")
    @ResponseBody
    public Map<String, Object> sendMessage (String group_idx, String msg_cont, HttpSession session) {
        Map<String, Object> list = new HashMap<String, Object>();
        String user_id = (String) session.getAttribute("loginId");
        if (user_id == null || user_id.isEmpty()){
            list.put("msg", "로그인하세요.");
        } else if (!message_service.checkPermitChat((String) session.getAttribute("loginId"), group_idx)){
            list.put("msg", "접근 권한이 없습니다.");
        } else {
            message_service.sendMessage(group_idx, msg_cont, user_id);
        }
        return list;
    }

    @RequestMapping (value = "/member_findMessageGroup.ajax")
    @ResponseBody
    public Map<String, Object> findMessageGroup (String member2, HttpSession session) {
        Map<String, Object> list = new HashMap<String, Object>();
        String member1 = (String) session.getAttribute("loginId");
        list.put("messageGroup", message_service.findMessageGroup(member1, member2));
        return list;
    }

}
