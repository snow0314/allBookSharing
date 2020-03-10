package com.allBookSharing.xxx.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IMemberDao;
import com.allBookSharing.xxx.dto.Member;

@Service
public class MemberManagement {

	
	@Autowired
	IMemberDao mDao;
	private ModelAndView mav=new ModelAndView();
	
	public ModelAndView showWishList(HttpServletRequest req) {
		mav = new ModelAndView();
		
		String id = (String) req.getSession().getAttribute("id");
		System.out.println("나의 아이디는 "+id);
		
		
		mav.setViewName("checkedlist");
		return mav;
	}

	public ModelAndView moveMypage() {
		mav = new ModelAndView();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User username = (User) authentication.getPrincipal();
		System.out.println("user="+username.getUsername());
		String id=username.getUsername();
		
		System.out.println("id="+id);
		
		Member mb=mDao.getMyPage(id);
		mav.addObject("mb",mb);
		mav.setViewName("myPage");
		return mav;
	}

	public ModelAndView modifyprofile() {
		mav = new ModelAndView();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User username = (User) authentication.getPrincipal();
		System.out.println("user="+username.getUsername());
		String id=username.getUsername();
		System.out.println("id="+id);
		Member mb=mDao.getMyPage(id);
		mav.addObject("mb",mb);
		mav.setViewName("myInfoModify");
		return mav;
	}
	
}
