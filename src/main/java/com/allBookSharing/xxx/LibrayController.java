package com.allBookSharing.xxx;


import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LibrayController {
	
	ModelAndView mav;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/librarymodifymove")
	public ModelAndView libraryModifyMove() { //도서관 정보 수정 페이지 이동
		
		return new ModelAndView("librarian/libraryModify");
	}
}
