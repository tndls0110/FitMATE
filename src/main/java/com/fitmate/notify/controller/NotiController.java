package com.fitmate.notify.controller;

import com.fitmate.notify.service.NotiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class NotiController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiService n_Service;

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
			logger.info("checkPermit2 / page address: "+page);
		}
	}



	@RequestMapping (value = "/alarm.go")
	public String goAlarm (Model model, HttpSession session) {
		page = "alarm";
		checkPermit("redirect:/alarm.go", model, session);

		return page;
	}

	@GetMapping (value = "/get_all_alarm.ajax")
	@ResponseBody
	public Map<String, Object> getAllAlarm (int idx,HttpSession session) {
		logger.info("idx:{}",idx);
		Map<String, Object> data = new HashMap<String, Object>();
		String id = session.getAttribute("loginId").toString();
		logger.info("세션에서 받아온 id 값 :{}",id);

		data.put("id", n_Service.getAllAlarm(id,idx));
		return data;
	}

	@GetMapping (value = "/read_change.ajax")
	@ResponseBody
	public Map<String, Object> read_change (int idx) {
		logger.info("idx:{}",idx);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", n_Service.read_change(idx));
		return data;
	}


	@GetMapping (value = "/delete_alarm.ajax")
	@ResponseBody
	public Map<String, Object> deleteAlarm (int idx) {
		logger.info("idx:{}",idx);
		Map<String, Object> data = new HashMap<>();
		data.put("success", n_Service.deleteAlarm(idx));
		return data;
	}

	@GetMapping (value = "/check_unreadAlarm.ajax")
	@ResponseBody
	public Map<String, Object> checkUnreadAlarm (HttpSession session) {
		Object id = session.getAttribute("loginId");
		//logger.info("세션에서 받아온 id 값 :{}",id);

		Map<String, Object> data = new HashMap<>();
		if (id != null) {
			String id_string = id.toString();
			String exists = n_Service.checkUnreadAlarm(id_string);
			data.put("exists", exists);
		}
		return data;
	}

	@GetMapping (value = "/unread_count.ajax")
	@ResponseBody
	public Map<String, Object> unreadCount (HttpSession session) {

		Object id = session.getAttribute("loginId");
		//logger.info("세션에서 받아온 id 값 :{}",id);
		Map<String, Object> data = new HashMap<>();
		if(id!=null) {
			String id_string = id.toString();
			int unread = n_Service.unread_count(id_string);
			data.put("count",unread);
		}
		return data;
	}
}
