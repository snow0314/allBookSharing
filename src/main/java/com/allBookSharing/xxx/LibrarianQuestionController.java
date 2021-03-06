package com.allBookSharing.xxx;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Answer;
import com.allBookSharing.xxx.dto.Question;
import com.allBookSharing.xxx.service.LibrarianManagement;
import com.allBookSharing.xxx.service.QuestionManagement;

@Controller
public class LibrarianQuestionController {

	
	@Autowired
	LibrarianManagement lm;
	
	@Autowired
	QuestionManagement qm;
	
	//사서가 보는 건의사항 게시판
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/lbquestionlist")
	public ModelAndView lbQuestionList(Principal principal) { 
	  ModelAndView mav= new ModelAndView();
	  
	  mav=lm.lbQuestionList(principal);
		
		return mav; 	
	}
	
	//사서 건의사항글 상세보기
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/lbqsdetail")
	public ModelAndView lbqsDetail(Question qus) { 
		ModelAndView mav= new ModelAndView();
		
		mav = lm.lbqsDetail(qus);
		
		return mav; 
	}

	
	//사서 건의사항글 상세보기
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/lbdeletequestion")
	public ModelAndView lbDeleteQuestion(Question qus) { 
		ModelAndView mav= new ModelAndView();
		
		mav = lm.lbDeleteQuestion(qus);
		
		return mav; 
	}
	
	//답변쓰기 
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/questionanswer")
	public ModelAndView questionAnswer(Answer as,Principal principal) { 
		ModelAndView mav= new ModelAndView();
		
		mav = lm.questionAnswer(as,principal);
		
		return mav; 
	}
	
	
}
