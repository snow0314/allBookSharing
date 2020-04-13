package com.allBookSharing.xxx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.service.UserReadingRoomManagement;

@Controller
public class ReadingRoomController {

		ModelAndView mav;
		
		@Autowired
		UserReadingRoomManagement rm;
	
		//메인페이지에서 열람실 예약 페이지로 이동하는 메소드
		@PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/readingroommove")
		public ModelAndView moveMypage() {
			
			
			return new ModelAndView("readingRoom");
		}
		
		//선택한 열람실 예약 페이지로 이동
		@PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/readingroomreservationmove")
		public ModelAndView readingRoomReservationMove(String rm_code, String rm_lcode) {
			mav = rm.readingRoomReservationMove(rm_code,rm_lcode);
			
			return mav;
		}
		
		
		
}
