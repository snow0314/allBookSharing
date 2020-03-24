package com.allBookSharing.xxx;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReadingRoomController {

		ModelAndView mav;
	
		//메인페이지에서 열람실 예약 페이지로 이동하는 메소드
		@PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/readingroommove")
		public ModelAndView moveMypage() {
			
			
			return new ModelAndView("readingRoom");
		}
		
		
		
}
