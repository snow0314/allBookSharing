package com.allBookSharing.xxx;


import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.service.LibrayManagement;
import com.allBookSharing.xxx.service.librayBookManagement;

@Controller
public class LibrayController {
	
	@Autowired
	private librayBookManagement lmm;
	
	@Autowired
	private LibrayManagement lm;
	
	ModelAndView mav;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/librarymain")
	public String libraryMain(Principal principal,HttpServletRequest req) { //사서 메인페이지 이동
		Map<String, Object> map=lmm.getLibrayCodeName(principal);
		
		req.getSession().setAttribute("LB_CODE", map.get("LB_CODE")); //도서관 코드 세션에 저장
		req.getSession().setAttribute("LB_NAME", map.get("LB_NAME")); //도서관 이름 세션에 저장
		
		
		return "librarian/librarymain";
	}
	
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/librarymodifymove")
	public ModelAndView libraryModifyMove() { //도서관 정보 수정 페이지 이동
		
		return new ModelAndView("librarian/libraryModify");
	}
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraymodify")
	public ModelAndView libraryModify(Library lib) { //도서관 정보 수정
		System.out.println("도서관 정보:"+lib.toString());
		mav=lm.libraryModify(lib);
		
		return mav;
	}
	
	
}
