package com.allBookSharing.xxx;





import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.service.QuestionManagement;



@Controller
public class QuestionController {
	@Autowired
	QuestionManagement qm;
	
	ModelAndView mav;
	//건의사항 페이지 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/questionmove")
	public ModelAndView QuestionList() {
		
		ModelAndView mav=new ModelAndView();
		
		mav = qm.QuestionList();
		 
		return mav;
	}
	
	//건의사항 글쓰기 페이지 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/movequestionwrite")
	public ModelAndView movequestionWrite() {
		
		ModelAndView mav=new ModelAndView();
		mav=qm.movequestionWrite();
		
		 
		return mav;
	}
	//건의사항 글 쓰기
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/questionwrite")
	public ModelAndView questionWrite() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("questionWrite");
		 
		return mav;
	}

}
