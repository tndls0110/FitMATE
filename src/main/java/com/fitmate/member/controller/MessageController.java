package com.fitmate.member.controller;

import com.fitmate.member.service.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        //checkPermit("redirect:/member_message.go", model, session);
        return page;
    }

    @RequestMapping (value = "/member_message.ajax")
    @ResponseBody
    public Map<String, Object> message (String groupIdx, HttpSession session) {
        Map<String, Object> list = new HashMap<String, Object>();
        //String user_id = (String) session.getAttribute("loginId");
        String user_id = "member08";
        list.put("roomList", message_service.roomList(user_id));
        if (!groupIdx.equals("") || groupIdx != null) {
            list.put("messageList", message_service.message(groupIdx));
        }
        return list;
    }

    @RequestMapping (value = "/member_message.do")
    public void message (@RequestParam Map<String, String> params, HttpSession session) {
        //String user_id = (String) session.getAttribute("loginId");
        String user_id = "member08";
        message_service.sendMessage(params, user_id);
    }

}