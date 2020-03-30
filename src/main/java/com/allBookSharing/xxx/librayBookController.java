package com.allBookSharing.xxx;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.allBookSharing.xxx.service.BookManagement;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Recommend;
import com.allBookSharing.xxx.service.librayBookManagement;

@Controller

public class librayBookController {


	@Autowired
	private librayBookManagement lmm;
	
	@Autowired
	private BookManagement bm;
	
	ModelAndView mav;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybooklistmove")
	public ModelAndView bookListMove() { //책 목록 페이지 이동
		
		return new ModelAndView("librarian/bookslist");
	}
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybookinsertmove")
	public ModelAndView bookInsertMove() { //책 등록 페이지 이동
		
		return new ModelAndView("librarian/bookinsert");
	 } 

	@GetMapping(value="/bookdetailpage")
	public ModelAndView bookDetailPage(String bk_code,String bk_lcode) {
		System.out.println("bk_lcode="+bk_lcode);
		mav=bm.bookDetailPage(bk_code,bk_lcode);
    
		return mav;
	}
	

	@GetMapping(value="/topdetailpage")
	public ModelAndView topDetailPage(String bk_code) {
		mav=bm.topDetailPage(bk_code);

		return mav;
	}

	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybookinsert")
	public ModelAndView bookInsert(Books book) { //책 등록하는 메소드

		mav=lmm.bookInsert(book);
		
		return mav;
	}
	
	@GetMapping(value="/besttopten")
	public ModelAndView bestTopTen(Loan l) {
		mav=bm.bestTopTen(l);
		return mav;
	}
	@GetMapping(value="/recommend")
	public ModelAndView recommendList(Recommend rm) {
		mav=bm.recommendList(rm);
		return mav;
	}
	
	
	@GetMapping(value="/mainbooksearch")
	public ModelAndView mainBookSearch(String bk_name) {
		mav=bm.mainBookSearch(bk_name);

		return mav;
	}
	
	//책 정보를 수정하는 메소드
	@Secured("ROLE_LIBRARIAN")	
	@RequestMapping(value = "/libraybookmodify" ,produces = "application/json;charset=UTF-8")
	public ModelAndView librayBookModify(Books book){ 
		mav=lmm.librayBookModify(book);
			
		return mav;
	}
	
	
}
