package com.allBookSharing.xxx.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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

	public int getBorrowCnt() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User username = (User) authentication.getPrincipal();
		System.out.println("user="+username.getUsername());
		String id=username.getUsername();
		
		System.out.println("id="+id);
		
		int cnt=mDao.getBorrowCnt(id);
		
		return cnt;
	}

	public int getArrearsCnt() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User username = (User) authentication.getPrincipal();
		System.out.println("user="+username.getUsername());
		String id=username.getUsername();
		System.out.println("id="+id);
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		
		int cnt=0;
		
		Date date=mDao.getArrearsCnt(id);
		
		System.out.println("date="+date);
		
		String date1=format1.format(date);
		System.out.println("date1="+date1);
		
		String[] date2=date1.split("-");
		
		String date3=date2[0]+date2[1]+date2[2];
		System.out.println("date3="+date3);
		int arrearDay=Integer.parseInt(date3);
		
		Date today1=new Date();
		String[] today2=format1.format(today1).split("-");
		String today3=today2[0]+today2[1]+today2[2];
		int today=Integer.parseInt(today3);
		System.out.println("today="+today);
		int day=arrearDay-today;
		System.out.println("day="+day);
		
		if(day<0) {
		cnt=mDao.getArrearsCnt2(id);
		System.out.println("cnt="+cnt);
		}

	
		return cnt;
	}

	public int getReviewCnt() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User username = (User) authentication.getPrincipal();
		System.out.println("user="+username.getUsername());
		String id=username.getUsername();
		System.out.println("id="+id);
		
		int cnt=mDao.getReviewcntCnt(id);
		return cnt;
	}
}
