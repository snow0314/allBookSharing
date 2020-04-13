package com.allBookSharing.xxx;





import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Question;
import com.allBookSharing.xxx.service.QuestionManagement;



@Controller
public class QuestionController {
	@Autowired
	QuestionManagement qm;
	
	ModelAndView mav;
	//건의사항 페이지 이동
	
	@GetMapping(value = "/questionmove")
	public ModelAndView questionList() {
		
		ModelAndView mav=new ModelAndView();
		
		mav = qm.QuestionList();
		 
		return mav;
	}
	
	//건의사항 글상세보기 
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/qsdetail")
	public ModelAndView questionDetail(Question qus) {
		
		ModelAndView mav=new ModelAndView();
		
		mav = qm.questionDetail(qus);
		 
		return mav;
	}
	//건의사항 글삭제 (본인글)
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/deletequestion")
	public ModelAndView deleteQuestion(Question qus) {
		
		ModelAndView mav=new ModelAndView();
		
		mav = qm.deleteQuestion(qus);
		
		return mav;
	}
	
	//건의사항 글상세보기 
		@PreAuthorize("isAuthenticated()")
		@PostMapping(value = "/qspwdetail")
		public ModelAndView questionPwDetail(Question qus) {
			
			ModelAndView mav=new ModelAndView();
			
			mav = qm.questionDetail(qus);
			 
			return mav;
		}
		
		
		
		//건의사항 수정페이지로 이동
		@PreAuthorize("isAuthenticated()")
		@PostMapping(value = "/updatequs")
		public ModelAndView questionUdateMove(Question qus) {
			
			ModelAndView mav=new ModelAndView();
			
			mav = qm.questionUdateMove(qus);
			
			return mav;
		}
		
		
		//건의사항 내가 쓴 글 수정
		@PreAuthorize("isAuthenticated()")
		@PostMapping(value = "/updatequestion")
		public ModelAndView questionUdate(Question qus) {
			System.out.println("수정하기 컨트롤러");
			ModelAndView mav=new ModelAndView();
			
			mav = qm.questionUdate(qus);
			
			return mav;
		}
	
	
	//건의사항 글쓰기 페이지 이동
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/movequestionwrite")
	public ModelAndView movequestionWrite() {
		
		ModelAndView mav=new ModelAndView();
		mav=qm.movequestionWrite();
		
		 
		return mav;
	}
	//건의사항 글 쓰기
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/questionwrite")
	public ModelAndView questionWrite(Question qus,Principal principal) {
		
		ModelAndView mav=new ModelAndView();
		
		System.out.println("qss="+qus);
		mav=qm.questionWrite(qus,principal);
		 
		return mav;
	}

}
