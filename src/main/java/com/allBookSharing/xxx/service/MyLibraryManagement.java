package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dao.IMyLibraryDao;
import com.allBookSharing.xxx.dto.Loan;
import com.google.gson.Gson;

@Service
public class MyLibraryManagement {

	@Autowired
	IMyLibraryDao mlDao;
	ModelAndView mav;
	
	
	//배송목록
	public ModelAndView getDeliveryList(Principal principal) {
		mav=new ModelAndView();
		String id=principal.getName();
		String view=null;
		List<Loan> lList=mlDao.getDeliveryList(id);
		
		if(lList!=null) {
			view="deliveryList";
		}
		else
			view="index";
			
		String json=new Gson().toJson(lList);
		mav.addObject("list",json);
		mav.setViewName(view);
		
		return mav;
	}
	
	
	//대출 목록
	public ModelAndView getLaonList(Principal principal) {
		mav=new ModelAndView();
		String id=principal.getName();
		String view=null;
		List<Loan> lList=mlDao.getLoanList(id);
		
		if(lList!=null) {
			view="loanList";
		}
		else
			view="index";
			
		String json=new Gson().toJson(lList);
		mav.addObject("list",json);
		mav.setViewName(view);
		
		return mav;
	}

	//희망도서 목록
	public ModelAndView getHopeList(Principal principal) {
		mav=new ModelAndView();
		String id=principal.getName();
		String view=null;
		List<Loan> lList=mlDao.getHopeList(id);
		
		if(lList!=null) {
			view="hopelist";
		}
		else
			view="index";
			
		String json=new Gson().toJson(lList);
		mav.addObject("list",json);
		mav.setViewName(view);
		
		return mav;
	}

	//희망도서 신청
	public ModelAndView bookRequestApply(Loan lan, Principal principal) {
		ModelAndView mav= new ModelAndView();
		String id= principal.getName();
		lan.setBr_id(id);
		
		System.out.println("lan="+lan);
		String view=null;
		
		boolean result= mlDao.bookRequestApply(lan);
		
		if(result) 
			view="redirect:/movehopelist";
		else
			view="bookRequestApply";
		
		mav.setViewName(view);
		
		return mav;
	}

	//희망도서 상세보기
}
