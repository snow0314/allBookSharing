package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.QuestionDao;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Question;
import com.google.gson.Gson;

@Service
public class QuestionManagement {

	
	@Autowired
	QuestionDao qDao;
	
	public ModelAndView QuestionList() {
		
		ModelAndView mav= new ModelAndView();
		String view=null;
		
		List<Question> qList=qDao.getQuestionList();
		
		if(qList!=null) {
			view= "questionList";
		}else
			view="questionList";
		
		String json=new Gson().toJson(qList);
		
		mav.addObject("qList",json);
		mav.setViewName(view);
		
		return mav;
	}

	public ModelAndView movequestionWrite() {
		
		ModelAndView mav= new ModelAndView();
		String view=null;
		List<Library> lList=qDao.getQuestionWrite(); //도서관 코드 불러오기
		
		if(lList!=null) {
			view="questionWrite";
		}else
			view="questionList";
		
		String json=new Gson().toJson(lList);
		
		mav.setViewName(view);
		return mav;
	}

//	public ModelAndView questionwrite(Principal principal) {
//		
//		ModelAndView mav= new ModelAndView();
//		String id= principal.getName();
//		String view=null;
//		
//		boolean result= qDao.questionWrite(id);
//		
//		mav.setViewName(view);
//		
//		return mav;
//	}

}
