package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.PromotionDAO;
import com.itbank.model.PromotionDTO;

@Service
public class PromotionService {
	
	@Autowired PromotionDAO dao;

	public List<PromotionDTO> getPromotionList(int offset) {
		return dao.selectList(offset);
	}
	
	
}
