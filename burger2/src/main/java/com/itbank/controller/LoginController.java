package com.itbank.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Hash;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class LoginController {

	@Autowired private MemberService ms;
	@Autowired private Hash	hash;
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberDTO dto, HttpSession session, HttpServletRequest request, HttpServletResponse response, String url) {
		ModelAndView mav = new ModelAndView();
		
		String auto = request.getParameter("auto");
		System.out.println("auto :" + auto);
		
		if(auto != null) {
			Cookie autoLogin = new Cookie("JSESSIONID", session.getId());
			autoLogin.setMaxAge(7200);
			autoLogin.setPath("/burger2_2");
			response.addCookie(autoLogin);
		}
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		
		
		MemberDTO login = ms.login(dto);
		session.setAttribute("login", login);
		
		if(url == null) {
			mav.setViewName("redirect:/");
		}
		else {
			mav.setViewName("redirect:" + url);
		}
		
		
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/update/{userid}")
	public ModelAndView update(@PathVariable String userid) {
		ModelAndView mav = new ModelAndView("update");
		MemberDTO update = ms.updatePage(userid);
		
		System.out.println(update.getUserpw());
		String pw = update.getUserpw().substring(0, 8);
		
		update.setUserpw(pw);
		
		mav.addObject("update", update);
		return mav;
	}
	
	
	@PostMapping("/update/{userid}")
	public String update(MemberDTO dto) {
		int row = ms.update(dto);
		System.out.println(row==1?"success":"fail");
		return "redirect:/update{userid}";	//추가되고 나서 목록에서 확인 할 수 있도록
	}
}
