package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BurgerDTO;
import com.itbank.model.ImageDAO;

@Service
public class ImageService {
	@Autowired private ImageDAO dao;
	public List<BurgerDTO> getBurgerList() {
		return dao.getBurgerList();
	}
}
