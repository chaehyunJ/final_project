package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.BurgerDTO;
import com.itbank.service.ImageService;

@RestController
public class AjaxController {
	@Autowired private ImageService is;
	@GetMapping("/order")
	public List<BurgerDTO> order() {
		System.out.println(is.getBurgerList());
		return is.getBurgerList();
	}
}
