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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.service.MemberManagement;

@Controller
public class MyPageController {

	@Autowired
	MemberManagement mm;
	
	ModelAndView mav=new ModelAndView();
	
	
	//마이페이지이동(내정보 불러오기)
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/movemypage")
	public ModelAndView moveMypage(Principal principal) {
		mav=mm.moveMypage(principal);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/modifyprofile")
	public ModelAndView modifyprofile(Principal principal) {
		mav=mm.modifyprofile(principal);
		
		return mav;
	}
	
	//찜목록
	@RequestMapping(value = "/showwishlist", method = RequestMethod.GET)
	public ModelAndView showWishList(Principal principal) {
		mav=mm.showWishList(principal);
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/profilecomplet")
	public ModelAndView profileComplet(MultipartHttpServletRequest multi,  Principal principal) {
		mav=mm.profileComplet(multi, principal);
		
		return mav;
	}
	
}
