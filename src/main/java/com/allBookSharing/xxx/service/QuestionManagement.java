package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dao.QuestionDao;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Question;
import com.google.gson.Gson;

@Service
public class QuestionManagement {

	
	@Autowired
	QuestionDao qDao;
	
	@Autowired
	IAdminManagementDao aDao;
	
	//건의사항페이지
	public ModelAndView QuestionList() {
		
		ModelAndView mav= new ModelAndView();
		String view=null;
		
		List<Question> qList=qDao.getQuestionList();
		System.out.println("qlist="+qList);
		
		if(qList!=null) {
			view= "questionList";
		}else
			view="questionList";
		
		String json=new Gson().toJson(qList);
		
		mav.addObject("qList",json);
		mav.setViewName(view);
		
		return mav;
	}
	
	
    //글쓰기 페이지 이동
	public ModelAndView movequestionWrite() {
		
		ModelAndView mav= new ModelAndView();
		String view=null;
		List<Library> lList=aDao.getlibraryinfo(); //도서관 코드 불러오기
		
		if(lList!=null) {
			view="questionWrite";
		}else
			view="questionList";
		
		String json=new Gson().toJson(lList);
		
		mav.addObject("list",json);
		mav.setViewName(view);
		return mav;
	}


    //건의사항 글쓰기
	public ModelAndView questionWrite(Question qus, Principal principal) {
		ModelAndView mav= new ModelAndView();
		String id= principal.getName();
		qus.setQs_id(id);
		
		System.out.println("qus="+qus);
		String view=null;
		
		boolean result= qDao.questionWrite(qus);
		
		if(result) 
			view="redirect:/questionmove";
		else
			view="questionWrite";
		
		mav.setViewName(view);
		
		return mav;
	}

	//건의사항 상세보기
	public ModelAndView questionDetail(int qs_num) {
		ModelAndView mav= new ModelAndView();
		String view=null;
		Question qus=qDao.getQuestionDetail(qs_num);
		
		if(qus!=null) 
			view="questionDetail";
		else
			view="redirect:/questionmove";
		
		//String json=new Gson().toJson(qus);
		
		mav.addObject("question",qus);
		
		mav.setViewName(view);
		
		return mav;
	}

}
