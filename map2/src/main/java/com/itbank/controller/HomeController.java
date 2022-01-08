package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController{
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/kakaopay")
	public String kakaopay() {
		return "kakaopay";
	}
	
	@GetMapping("/fail")
	public String fail() {
		return "fail";
	}
	
	@GetMapping("/cancel")
	public String cancel() {
		return "cancel";
	}
}