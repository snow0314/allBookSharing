package com.allBookSharing.xxx;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Hope;
import com.allBookSharing.xxx.service.HopeManagerment;

@Controller
public class LibraryHopeController {

	@Autowired
	HopeManagerment hm;
	
	//사서 희망도서 목록
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/lbhopelist")
	public ModelAndView lbHopeList(Principal principal) { //도서관 정보 수정 페이지 이동
		ModelAndView mav=new ModelAndView();
		mav=hm.lbHopeList(principal);
		
		return mav;
	}
	
	
	
}
