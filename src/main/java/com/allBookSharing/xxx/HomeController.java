package com.allBookSharing.xxx;


import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.dto.Notice;
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

	//회원가입
	@PreAuthorize("isAnonymous()")
	@PostMapping(value = "/memberjoin")
	public ModelAndView memberJoin(MultipartHttpServletRequest multi) {
		System.out.println("멀티멀티티티 = "+multi);
		mav = jm.memberJoin(multi);

		return mav;
	}
	
	/*
	 * //로그인 정보표시
	 * 
	 * @PreAuthorize("isAuthenticated()")
	 * 
	 * @PostMapping(value = "/logininfo") public ModelAndView loginInfo(Principal
	 * principal) {
	 * 
	 * mav = mm.loginInfo(principal);
	 * 
	 * return mav; }
	 */
	
	//회원탈퇴
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/memberdrop")
	public ModelAndView memberDrop(HttpServletRequest req,Principal principal) {
		System.out.println("회원탈퇴");
		mav = mm.memberDrop(principal);
		req.getSession().invalidate(); //세션초기화
		return mav;
	}
	
	
	//홈으로
	@RequestMapping(value = "/")
	public String home() {

		return "index";
	}
	
	//포인트충전 페이지
	   @PreAuthorize("isAuthenticated()")
	   @RequestMapping(value = "/insertpoint")
	   public String pointUser() {
	    System.out.println("point:");
	      return "PointUser";
	   }
	
	 //포인트 충전하기
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
	


	//로그인페이지 이동
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/loginfrm")
	public String loginFrm() {

		return "commom/login";
	}

	//아이디찾기 페이지
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
	
	//통합검색
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/totalsearch")
	public String totalSearch() {
		
		return "totalSearch";
	}
	
	//희망도서 페이지 이동
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/hopebookmove")
	public String hopebookmove() {
		
		return "bookrequest";
	}
	//희망도서 신청폼  페이지
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/hopebookapply")
	public String hopebookapply() {
		
		return "bookrequestapply";
	}
	
	//열람실 예약안내 
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/readingroominformation") 
	public String readingroominformation() {
		
		return "readingRoomInformation";
	}
  
	//회원등급 기준안내
		@PreAuthorize("isAuthenticated()")
		@RequestMapping(value="/membergrade")
		public String membergrade() {
			
			return "memberGrade";

		}

	//도서관 일정보기 이동
	@RequestMapping(value = "/libraryschedulemove")
	public String libraryScheduleMove() {
		
		return "librarySchedule";
	}
}



