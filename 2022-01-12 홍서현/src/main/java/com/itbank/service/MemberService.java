package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {
	
	@Autowired private MemberDAO dao;
	
	public String getAgreement(String path) throws IOException {
		String agreement = "";
		File f = new File(path);
		
		if(f.exists() == false) {
			System.out.println("파일이 없습니다");
			return null;
		}
		Scanner sc = new Scanner(f);
		
		while(sc.hasNextLine()) {
			agreement += sc.nextLine() + "\n";
		}
		sc.close();
		return agreement;
	}

	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.login(dto);
		return login;
	}

}
