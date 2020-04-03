package com.allBookSharing.xxx;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.LibraryDelivery;
import com.allBookSharing.xxx.service.LibraryDeliveryManagement;

@Controller
public class librayDeliveryController {
	
	@Autowired
	LibraryDeliveryManagement ldm;
	
	//배송  관리 페이지 이동
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/deliverymanagementmove")
	public ModelAndView deliveryManagementMove(HttpServletRequest req) { //배송 관리 페이지 이동
		ModelAndView mav=new ModelAndView();
		
		mav=ldm.deliveryManagementMove(req);
		
		return mav;
		
	}
	
	//배송완료
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/lbdeliverycomplete")
	public ModelAndView lbDeliveryComplete(LibraryDelivery ld) { 
		ModelAndView mav=new ModelAndView();
		
		mav=ldm.lbDeliveryComplete(ld);
		
		return mav;
		
	}
	
	//반납관리 페이지이동
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/returnbooksmanagementmove")
	public ModelAndView lbReturnBooksManagementMove(HttpServletRequest req) { 
		ModelAndView mav=new ModelAndView();
		
		mav=ldm.lbReturnBooksManagementMove(req);
		
		return mav;
		
	}
	
	
	//반납완료
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/returnbookcomplete")
	public ModelAndView returnBookComplete(HttpServletRequest req,LibraryDelivery ld) { 
		ModelAndView mav=new ModelAndView();
		
		mav=ldm.returnBookComplete(req,ld);
		
		return mav;
		
	}
	
	
	
}
