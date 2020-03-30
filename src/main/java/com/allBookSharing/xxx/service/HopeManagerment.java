package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IHopeDao;
import com.allBookSharing.xxx.dto.BookExchange;
import com.allBookSharing.xxx.dto.Hope;
import com.google.gson.Gson;

@Service
public class HopeManagerment {

	@Autowired
	IHopeDao hDao;
	
	//사서 희망도서 목록
	public ModelAndView lbHopeList(Principal principal) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		String id=principal.getName();
		
		List<Hope> hList=hDao.lbHopeList(id);
		
		System.out.println("hList"+hList);
		
			view="librarian/libraryHopeList";
		
			
		String json=new Gson().toJson(hList);
		
		mav.addObject("list",json);
		mav.setViewName(view);
		
		return mav;
	}

	
	//희망도서 반려하기
	public ModelAndView hopeReturn(Hope hope) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		boolean result=hDao.updateHopeReturn(hope);
		
		if(result)
			view="redirect:/lbhopelist";
		else
			view="librian/librarymain";
		mav.setViewName(view);
		return mav;
	}


	public ModelAndView hopeComplete(Hope hope) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		boolean result=hDao.updateHopeComplete(hope);
		
		if(result)
			view="redirect:/lbhopelist";
		else
			view="librian/librarymain";
		mav.setViewName(view);
		
		return mav;
	}


	public ModelAndView exchange(BookExchange exchange, HttpServletRequest req, Hope hope) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결
		exchange.setBe_lcode(Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE"))));
		
		boolean result1=hDao.insertExchange(exchange);
		boolean result2=hDao.updateHopeProcessing(hope);
		
		if(result1&&result2) 
			view="redirect:/lbhopelist";	
		else
			view="libraian/librarymain";
		
		mav.setViewName(view);
		
		return mav;
	}


	public ModelAndView hopeCancel(Hope hope) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		boolean result=hDao.mutualLaonCancel(hope);
		
		view="redirect:/lbhopelist";

		mav.setViewName(view);
		return mav;
	}

}
