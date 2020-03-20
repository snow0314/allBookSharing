package com.allBookSharing.xxx;

import java.security.Principal;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReadingRoomController {

		ModelAndView mav;
	
		@PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/readingroommove")
		public ModelAndView moveMypage() {
			
			
			return new ModelAndView("readingRoom");
		}
}
