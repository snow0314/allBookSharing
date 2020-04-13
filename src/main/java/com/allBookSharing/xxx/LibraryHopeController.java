package com.allBookSharing.xxx;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.BookExchange;
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
	
	
	//희망도서 반려하기
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/hopereturn")
	public ModelAndView hopeReturn (Hope hope) {
		ModelAndView mav=new ModelAndView();
		mav=hm.hopeReturn(hope);
		
		return mav;
	}
	
	//희망도서신청 완료하기
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/hopecomplete")
	public ModelAndView hopeComplete (Hope hope) {
		ModelAndView mav=new ModelAndView();
		
		mav=hm.hopeComplete(hope);
		
		return mav;
	}
	
	
	//상호대차 신청하기
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/exchange")
	public ModelAndView exchange (BookExchange exchange,HttpServletRequest req,Hope hope) {
		ModelAndView mav=new ModelAndView();
		System.out.println("상호대차 신청 url");
		System.out.println("exchange"+exchange);
		System.out.println("hope"+hope);
		mav=hm.exchange(exchange,req,hope);
		
		return mav;
	}
	
	
	
	
	//상호대차 신청하기
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/hopecancel")
	public ModelAndView hopeCancel (Hope hope) {
		ModelAndView mav=new ModelAndView();
		System.out.println("상호대차 취소 url");
		System.out.println("hope"+hope);
		mav=hm.hopeCancel(hope);
		
		return mav;
	}
	
	
	
	
	
}
