package com.fitmate.error.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorControllerImpl implements ErrorController {
    Logger logger = LoggerFactory.getLogger(getClass());

    // 오류 컨트롤러
    @RequestMapping(value = "/error")
    public String error(Model model, HttpServletRequest req) {

        int code = (int) req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);   // 오류 코드
        model.addAttribute("code", code);

        String msg ="알 수 없는 오류가 발생했습니다. 다시 시도하세요.";
        switch (code) {
            case 400:
                msg="입력 값 수를 확인하세요.";
                break;
            case 403:
                msg="접근 권한이 없습니다.";
                break;
            case 404:
                msg="요청 또는 페이지가 없습니다.";
                break;
            case 405:
                msg="전송 방식이 맞지 않습니다.";
                break;
            case 500:
                msg="서버 처리 중 문제가 발생했습니다.";
                break;
        }
        model.addAttribute("msg", msg);
        return "error";
    }
}
