package com.allBookSharing.xxx;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Question;
import com.allBookSharing.xxx.service.MyLibraryManagement;
import com.sun.tools.internal.ws.processor.model.Request;

@Controller
public class MyLibraryContoroller {

	
	@Autowired
	MyLibraryManagement ml;

	//배송목록
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/movedeliverylist", method = RequestMethod.GET)
	public ModelAndView moveDeliveryList(Principal principal) {
		ModelAndView mav=new ModelAndView();
		mav=ml.getDeliveryList(principal);		
		return mav;
	}
	
	//대출목록
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/moveloanlist", method = RequestMethod.GET)
	public ModelAndView moveLaonList(Principal principal) {
		ModelAndView mav=new ModelAndView();
		mav=ml.getLaonList(principal);		
		return mav;
	}
	
	//희망도서 목록목록
		@PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/movehopelist", method = RequestMethod.GET)
		public ModelAndView moveHopelist(Principal principal) {
			ModelAndView mav=new ModelAndView();
			mav=ml.getHopeList(principal);		
			return mav;
		}
		
	//희망도서 신청
		@PreAuthorize("isAuthenticated()")
		@PostMapping(value = "/bookrequestapply")
		public ModelAndView bookrRequestApply(Loan lan,Principal principal) {
			
			ModelAndView mav=new ModelAndView();
			
			System.out.println("lan="+lan);
			mav=ml.bookRequestApply(lan,principal);
			 
			return mav;
		}
	
	//희망도서 상세보기
		
	
}
