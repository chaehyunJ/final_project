package com.itbank.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MemberService;

@Controller
public class JoinController {

	@Autowired private MemberService ms;
	
	@GetMapping("/join")
	public ModelAndView step0(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView("join/step0");
		
		String path = request.getSession().getServletContext().getRealPath("resources/agreement.txt");
	
		String agreement = ms.getAgreement(path);
		mav.addObject("agreement", agreement);
		
		return mav;
	}
	
	@GetMapping("/join/step1")
	public ModelAndView step1(String agree, @RequestHeader("referer") String referer) {
		ModelAndView mav = new ModelAndView("join/step1");
		
		if(agree == null) {
			mav.setViewName("alert");
			mav.addObject("msg", "약관에 동의하셔야 가입이 가능합니다");
			mav.addObject("url", referer);
		}
		
		return mav;
	}
	
	@GetMapping("/join/step2")
	public ModelAndView step2() {
		ModelAndView mav = new ModelAndView("join/step2");
		return mav;
	}
	
}
