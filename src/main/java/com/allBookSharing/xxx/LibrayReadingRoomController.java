package com.allBookSharing.xxx;

import java.security.Principal;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LibrayReadingRoomController {
	ModelAndView mav;
	
	@Secured("ROLE_LIBRARIAN")	
	@RequestMapping(value = "/readingroominsertmove")
	public ModelAndView readingRoomInsertMove(Principal principal) { 
		
		return new ModelAndView("librarian/readingRoomInsert");
	}
}
