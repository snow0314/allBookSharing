package com.allBookSharing.xxx;


import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LibrayReadingRoomController {
	ModelAndView mav;
	
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
	
}
