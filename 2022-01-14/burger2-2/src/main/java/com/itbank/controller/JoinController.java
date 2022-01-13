package com.itbank.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Hash;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class JoinController {

	@Autowired private MemberService ms;
	@Autowired private Hash hash;
	
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
	
	@PostMapping("/join/step2")
	public ModelAndView step2(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("join/step2");
		
		String hashpw = hash.getHash(dto.getUserpw());
		dto.setUserpw(hashpw);
		
		int row = ms.join(dto);
		if(row == 1) {
			System.out.println("가입 성공");
			mav.setViewName("alert");
			mav.addObject("msg", "가입 성공");
			mav.addObject("url", "login");
		
		}
		else {
			System.out.println("가입 실패");
			mav.setViewName("alert");
			mav.addObject("msg", "회원가입에 실패하였습니다!!");
		}
		return mav;
	}
	
}
