package com.allBookSharing.xxx;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

	ModelAndView mav=new ModelAndView();
	@RequestMapping(value = "/show/wishlist", method = RequestMethod.GET)
	public ModelAndView showWishList() {
		
		
		return mav;
	}
	
}
