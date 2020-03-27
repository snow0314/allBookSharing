package com.allBookSharing.xxx.service;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dao.ILibrarianManagementDao;
import com.allBookSharing.xxx.dao.QuestionDao;
import com.allBookSharing.xxx.dto.Answer;
import com.allBookSharing.xxx.dto.Librarian;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Question;
import com.google.gson.Gson;

@Service
public class LibrarianManagement {
	
	@Autowired
	ILibrarianManagementDao lDao;

	@Autowired
	IAdminManagementDao aDao;
	
	@Autowired
	QuestionDao qDao;
	
	ModelAndView mav;


	public ModelAndView librarianinsert(Librarian lia) {
		ModelAndView mav=new ModelAndView();
		
		BCryptPasswordEncoder pwdEncoder =new BCryptPasswordEncoder();
		lia.setLa_pw(pwdEncoder.encode(lia.getLa_pw()));
		boolean result=lDao.librarianinsert(lia);
		System.out.println("result="+result);
		
		if(result) {
		mav.setViewName("admin/adminindex");
		}
		else {
			mav.setViewName("admin/librarianinsert");
			
		}
		
		return mav;
	}


	public List<Library> getlibraryinfo() {
		List<Library> lib= aDao.getlibraryinfo();
		return lib;
	}


	public String LibrarianDelete(String la_id) {
		int result=0;
		
		result=aDao.LibrarianDelete(la_id);
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}


	public List<Library> getinfo() {
		List<Library> lib= aDao.getinfo();
		return lib;
	}


	//사서가 보는 건의사항 게시판
	public ModelAndView lbQuestionList(Principal principal) {
		ModelAndView mav=new ModelAndView();
		String id=principal.getName();
		String view=null;
		
		List<Question> qList=lDao.lbQuestionList(id);
		
		if(qList!=null) 
			view="librarian/libraryQuestionList";
		else
	    	view="librarian/librarymain";
	
		String json=new Gson().toJson(qList);
		mav.addObject("list",json);
	
		mav.setViewName(view);
		
		
		return mav;
	}


	public ModelAndView lbqsDetail(Question qus2) {
		ModelAndView mav= new ModelAndView();
		String view=null;
		Question qus=qDao.getQuestionDetail(qus2);
		Answer ans=qDao.getAnswer(qus2);
		
		if(qus!=null) 
			view="librarian/questionAnswer";
		else
			view="librarian/librarymain";
		
		//String json=new Gson().toJson(qus);
		
		mav.addObject("question",qus);
		mav.addObject("answer",ans);
		
		mav.setViewName(view);
		return mav;
	}

	//답변 쓰기
	public ModelAndView questionAnswer(Answer as, Principal principal) {		
		ModelAndView mav= new ModelAndView();
		as.setAw_id(principal.getName());
		String view=null;
		boolean result=lDao.questionAnswer(as);
		
		if(result) {
			boolean result2=lDao.updateState(as);
			if(result2)
			view="redirect:/lbquestionlist";
		}
		else
			view="librarian/librarymain";
		
		mav.setViewName(view);
		
		return mav;
	}

	//건의 사항글 삭제 (사서전용)
	public ModelAndView lbDeleteQuestion(Question qus) {
		ModelAndView mav= new ModelAndView();
		String view=null;
		
		boolean result=qDao.deleteQuestion(qus);
		
		if(result)
			view="redirect:/lbquestionlist";
		else
			view="redirect:/lbdeletequestion";
		
		mav.setViewName(view);
		
		return mav;
	}
		
	
	
	
	
}
	
