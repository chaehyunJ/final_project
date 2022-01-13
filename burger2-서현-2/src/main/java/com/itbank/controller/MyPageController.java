package com.itbank.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {

	@GetMapping("/myPage")
	public String myPage() {
		return "myPage";
	}
	@GetMapping("/myPage_order")
	public String myPage_order() {
		return "myPage_order";
	}
	@GetMapping("/history")
	public String history() {
		return "history";
	}
	@GetMapping("/update")
	public String memberInfo() {
		return "update";
	}
}
