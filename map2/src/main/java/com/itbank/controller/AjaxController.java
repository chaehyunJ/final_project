package com.itbank.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxController {

	@GetMapping("/ajaxKakao")
	public String ajaxkakao()  {
		
		try {
			URL requestURL = new URL("http://kapi.kakao.com/v1/payment/ready");
			
			// 전봇대를 연결시켜주는 전깃줄같은 느낌 : 서버연결
			HttpURLConnection conn = (HttpURLConnection)requestURL.openConnection();
			
			conn.setRequestMethod("POST");
			
			// 인증
			conn.setRequestProperty("Authorization", "KakaoAK ef6df41d734741abf8dc15d03214054d");
			
			// type
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			// 서버에 넣어줄게 있으면 true output은 기본값이 false라서 true라고 변경한다
			conn.setDoOutput(true);
			
			String param = "cid=TC0ONETIME&"
					+ "partner_order_id=partner_order_id&"
					+ "partner_user_id=partner_user_id&"
					+ "item_name=주문상품&"
					+ "quantity=5&"
					+ "total_amount=23000&"
					+ "tax_free_amount=2300&"
					+ "approval_url=http://localhost:8080/map2/kakaopay&"
					+ "cancel_url=http://localhost:8080/map2/cancel&"
					+ "fail_url=http://localhost:8080/map2/fail";
			
			// param 전달하는 것
			OutputStream outpt = conn.getOutputStream();
			
			// data를 전달
			DataOutputStream dataos = new DataOutputStream(outpt);
			
			// data를 전달할 때 param을 넣어서 전달
			dataos.writeBytes(param);
			
			// 자기가 가지고 있는 것을 보내는 역할
//			dataos.flush();
			
			// 닫기
			dataos.close();
			
			// 결과
			int result = conn.getResponseCode();
			
			InputStream inputst;
			
			if(result == 200) {
				inputst = conn.getInputStream();
			}
			else {
				inputst = conn.getErrorStream();
			}
			
			// 읽는애
			InputStreamReader inputsr = new InputStreamReader(inputst);
			
			// 형변환 하는 애
			BufferedReader buffer = new BufferedReader(inputsr);
			
			return buffer.readLine();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "{\"result\" : \"NO\"}";
	}
}
