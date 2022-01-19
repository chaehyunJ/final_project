package com.itbank.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.PaymentDAO;

@Service
public class PaymentService {
	@Autowired private PaymentDAO pdao;
	public int payment(HashMap<String,String> map) {
		return pdao.payment(map);
	}
}
