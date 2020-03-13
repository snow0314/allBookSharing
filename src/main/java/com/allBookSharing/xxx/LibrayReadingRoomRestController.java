package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Books;

public class LibrayReadingRoomRestController {
	
	ModelAndView mav;
	
	@Secured("ROLE_LIBRARIAN")	
	@RequestMapping(value = "/readingroominsertmove")
	public ModelAndView getBookList(Principal principal) { //책 목록 가져오기
		
		return new ModelAndView("librarian/readingRoomInsert");
	}	
}
