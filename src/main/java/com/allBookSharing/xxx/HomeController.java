package com.allBookSharing.xxx;


import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.service.JoinManagement;
import com.allBookSharing.xxx.service.MemberManagement;

@Controller
public class HomeController {

	@Autowired
	JoinManagement jm;
	
	@Autowired
	MemberManagement mm;
	
	@Autowired
	MemberManagement pt;

	private ModelAndView mav;

	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/joinfrm", method = RequestMethod.GET)
	public ModelAndView joinFrm() {
		mav = new ModelAndView();
		mav.setViewName("joinfrm");

		return mav;
	}

	@RequestMapping(value = "/memberjoin", method = RequestMethod.GET)
	public ModelAndView memberJoin(Member mb) {

		mav = jm.memberJoin(mb);

		return mav;
	}

	@RequestMapping(value = "/")
	public String home() {

		return "index";
	}
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/insertpoint")
	public String pointUser() {
    System.out.println("point:");
		return "PointUser";
	}
	
	@RequestMapping(value = "/okpoint", method = RequestMethod.POST)
	public ModelAndView okPoint(Member mb,Principal principal) {

	
		mav = mm.okPoint(mb,principal);

		return mav;
	}
	
	//거래내역
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/pointlist")
	public ModelAndView pointList(Principal principal) {
    
		 mav= mm.pointList(principal);
		return mav;
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

	
	// 비밀번호 찾기 폼
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/pwfindfrm")
	public String pwFindFrm() throws Exception{
		return "commom/pwFind";
	}
	
	
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/totalsearch")
	public String totalSearch() {
		
		return "totalSearch";
	}
	
}



