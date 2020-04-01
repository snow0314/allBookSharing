package com.allBookSharing.xxx;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.service.LibraryDeliveryManagement;

@Controller
public class librayDeliveryController {
	
	@Autowired
	LibraryDeliveryManagement ldm;
	
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/deliverymanagementmove")
	public ModelAndView deliveryManagementMove(HttpServletRequest req) { //배송 관리 페이지 이동
		ModelAndView mav=new ModelAndView();
		
		mav=ldm.deliveryManagementMove(req);
		
		return mav;
		
	}
}
