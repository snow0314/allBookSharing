package com.allBookSharing.xxx;


import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.stereotype.Service;
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
		
		mav= jm.memberJoin(mb);

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
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/totalsearch")
	public String totalSearch() {
		
		return "totalSearch";
	}
	
}

}

