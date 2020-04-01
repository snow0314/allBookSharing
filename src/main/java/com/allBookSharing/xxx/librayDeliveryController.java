package com.allBookSharing.xxx;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class librayDeliveryController {
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/deliverymanagementmove")
	public ModelAndView deliveryManagementMove() { //배송 관리 페이지 이동
		
		return new ModelAndView("librarian/deliveryList");
	}
}
