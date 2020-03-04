package com.allBookSharing.xxx;


import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	ModelAndView mav;
	
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		
		return "home";
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
