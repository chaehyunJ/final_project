package com.itbank.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.BurgerDTO;
import com.itbank.model.DrinkDTO;
import com.itbank.model.MacMorningDTO;
import com.itbank.model.McafeDTO;
import com.itbank.model.SideDTO;
import com.itbank.service.ImageService;

@RestController
public class AjaxController {
	@Autowired private ImageService is;
	@GetMapping("/mac")
	public List<MacMorningDTO> mac() {
		return is.getmacList();
	}
	@GetMapping("/macSet")
	public List<MacMorningDTO> macSet() {
		return is.getmacSetList();
	}
	
	@GetMapping("/burger")
	public List<BurgerDTO> burger() {
		return is.getburgerList();
	}
	
	@GetMapping("/burgerSet")
	public List<BurgerDTO> burgerSet() {
		return is.getburgerSetList();
	}
	
	@GetMapping("/side")
	public List<SideDTO> side() {
		return is.getsideList();
	}
	
	@GetMapping("/drink")
	public List<DrinkDTO> drink() {
		return is.getdrinkList();
	}
	
	@GetMapping("/dessert")
	public List<DrinkDTO> dessert() {
		return is.getdessertList();
	}
	
	@GetMapping("/mcafe")
	public List<McafeDTO> mcafe() {
		return is.getmcafeList();
	}
}
