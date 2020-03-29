package com.allBookSharing.xxx;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.BookExchange;
import com.allBookSharing.xxx.service.MutualLoanManagerment;

@Controller
public class MutualLoanController {
	
	
	@Autowired
	MutualLoanManagerment mLm;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/mutualloanmove")
	public ModelAndView mutualLoanmove(HttpServletRequest req) { 
	  ModelAndView mav= new ModelAndView();
	  
	  mav=mLm.mutualLoanmove(req);
		
		return mav; 	
	}
	
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/mutulloanaccept")
	public ModelAndView mutulLoanAccept(BookExchange bookEx) { 
		ModelAndView mav= new ModelAndView();
		
		mav=mLm.mutulLoanAccept(bookEx);
		
		return mav; 	
	}
	

	
	
}
