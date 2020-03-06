package com.allBookSharing.xxx;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.service.MemberManagement;

@Controller
public class MyPageController {

	@Autowired
	MemberManagement mm;
	
	ModelAndView mav=new ModelAndView();
	
	
	
	@RequestMapping(value = "/movemypage")
	public ModelAndView idFindFrm() {
		mav=mm.moveMypage();
		return mav;
	}
	
	
	@RequestMapping(value = "/modifyprofile", method = RequestMethod.GET)
	public ModelAndView modifyprofile() {
		mav=mm.modifyprofile();
		
		return mav;
	}
	
	
	@RequestMapping(value = "/showwishlist", method = RequestMethod.GET)
	public ModelAndView showWishList(HttpServletRequest req) {
		mav=mm.showWishList(req);
		
		return mav;
	}
	
}
