package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController{
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/menu")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("menu/list");
		
		return mav;
	}
}