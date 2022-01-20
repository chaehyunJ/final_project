package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.NoticeDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService bs;
	
	@GetMapping("/news")
	public ModelAndView news() {
		ModelAndView mav = new ModelAndView();
		List<NoticeDTO> list = bs.getNotice();
		
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/newsDetail/{seq}")
	public ModelAndView newsDetail(@PathVariable int seq) {
		ModelAndView mav = new ModelAndView("board/newsDetail");
		
		NoticeDTO dto = bs.getNews(seq);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("cnt", dto.getCnt());
		
		int newCnt = bs.cntUpdate(map);
		
		NoticeDTO dto1 = bs.getNews(seq);
		
		mav.addObject("dto", dto1);
		
		return mav;
	}
	
	@GetMapping("/question")
	public void question() {}
	
}