package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.promotion.PromDTO;
import com.itbank.service.MenuService;

@RestController
public class AjaxController {

	@Autowired private MenuService ms;
	
	@GetMapping("/ajaxPromotion")
	public List<PromDTO> promList(){
		return ms.getList();
	}
}
