package com.allBookSharing.xxx;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private ModelAndView mav;

	
	@PreAuthorize("isAnonymous()") // 로그인 안했을때 접근 불가
	@RequestMapping(value = "/joinfrm", method = RequestMethod.GET)
	public ModelAndView joinFrm() {
		mav = new ModelAndView();
		mav.setViewName("joinFrm");

		return mav;
	}

	@RequestMapping(value = "/")
	public String home() {
		
		return "index";
	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/loginfrm")
	public String loginFrm() {
		
		return "commom/login";
	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/idfindfrm")
	public String idFindFrm() {
		
		return "commom/idFind";
	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/pwfindfrm")
	public String pwFindFrm() {
		
		return "commom/pwFind";
	}
	
}
