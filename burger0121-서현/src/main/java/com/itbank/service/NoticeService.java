package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;

@Service
public class NoticeService {

	@Autowired private NoticeDAO dao;
	
	public NoticeDTO getNotice(int num) {
		
		return dao.nextNotice(num);
	}

}
