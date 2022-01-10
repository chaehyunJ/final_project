package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.PromotionDTO;
import com.itbank.service.PromotionService;

@RestController
public class AjaxController {
	
	@Autowired PromotionService ps;
	
	@GetMapping("/getImageList/{offset}")
	public List<PromotionDTO> getPromotionList(@PathVariable int offset) {
		return ps.getPromotionList(offset);
	}

}
