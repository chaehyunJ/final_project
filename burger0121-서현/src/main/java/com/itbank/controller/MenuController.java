package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired private MenuService ms;
	
	@GetMapping("/list")
	public void list() {}
	
	@GetMapping("/list/{table}")
	public ModelAndView list(@PathVariable String table) {
		ModelAndView mav = new ModelAndView("/menu/list");

		int cnt = ms.countList(table);
		
		mav.addObject("cnt", cnt);
		mav.addObject("table", table.toUpperCase() + "_TABLE");

		return mav;
	}
}
