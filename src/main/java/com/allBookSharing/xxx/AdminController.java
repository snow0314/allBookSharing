package com.allBookSharing.xxx;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	private ModelAndView mav;
	//관리자 메인화면
	 @RequestMapping(value ="/adminmain", method = RequestMethod.GET) 
	 public String adminindex() throws Exception {

		 return "admin/adminindex";
	 }
	 @RequestMapping(value = "/libraryAdd")
		public String libraryAdd() {
			
			return "admin/libraryAdd";
		}
}



	//sfsdfsdf;df;lsfsdfsdf
