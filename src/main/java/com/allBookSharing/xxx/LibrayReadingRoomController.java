package com.allBookSharing.xxx;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.service.ReadingRoomManagement;

@Controller
public class LibrayReadingRoomController {
	ModelAndView mav;
	
	@Autowired
	ReadingRoomManagement rm;
	
	@Secured("ROLE_LIBRARIAN")	//열람실 등록 페이지 이동
	@RequestMapping(value = "/readingroominsertmove")
	public ModelAndView readingRoomInsertMove() { 
		
		return new ModelAndView("librarian/readingRoomInsert");
	}
	
	@Secured("ROLE_LIBRARIAN")	 //열람실 목록 페이지 이동
	@RequestMapping(value = "/readingroomlistmove")
	public ModelAndView readingRoomListMove() { 
		
		return new ModelAndView("librarian/readingRoomList");
	}
	
	@Secured("ROLE_LIBRARIAN") //열람실 수정 페이지 이동 및 
	@RequestMapping(value = "/readingroommodify")
	public ModelAndView readingRoomModifyMove(String rm_code) {
		mav=rm.readingRoomModifyMove(rm_code);
		
		return mav;
	}
}
