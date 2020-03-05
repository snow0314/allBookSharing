package com.allBookSharing.xxx.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MemberManagement {

	private ModelAndView mav=new ModelAndView();
	
	public ModelAndView showWishList(HttpServletRequest req) {
		mav = new ModelAndView();
		
		String id = (String) req.getSession().getAttribute("id");
		System.out.println("나의 아이디는 "+id);
		
		
		mav.setViewName("checkedlist");
		return mav;
	}

	public ModelAndView moveMypage(HttpServletRequest req) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal();
		System.out.println("user="+user.getUsername());
//		String id = (String) req.getSession().getAttribute("id");
//		System.out.println("나의 아이디는 "+id);

		
		
		mav.setViewName("myPage");
		return mav;
	}

}
