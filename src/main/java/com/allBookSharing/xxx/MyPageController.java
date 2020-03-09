package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.service.MemberManagement;

@Controller
public class MyPageController {

	@Autowired
	MemberManagement mm;
	
	ModelAndView mav=new ModelAndView();
	
	
	
	@RequestMapping(value = "/movemypage")
	public ModelAndView moveMypage(Principal principal) {
		mav=mm.moveMypage(principal);
		return mav;
	}
	
	
	@RequestMapping(value = "/modifyprofile", method = RequestMethod.GET)
	public ModelAndView modifyprofile(Principal principal) {
		mav=mm.modifyprofile(principal);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/showwishlist", method = RequestMethod.GET)
	public ModelAndView showWishList(HttpServletRequest req) {
		mav=mm.showWishList(req);
		
		return mav;
	}
	
	@RequestMapping(value = "/profilecomplet", method = RequestMethod.GET)
	public ModelAndView profileComplet(Principal principal,Member mb) {
		mav=mm.profileComplet(principal);
		
		return mav;
	}
	
}
