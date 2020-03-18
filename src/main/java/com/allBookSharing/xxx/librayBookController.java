package com.allBookSharing.xxx;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.allBookSharing.xxx.service.BookManagement;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Books;
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
<<<<<<< HEAD
	public ModelAndView bookDetailPage(String bk_code,String bk_lcode) {
		System.out.println("bk_lcode="+bk_lcode);
		mav=bm.bookDetailPage(bk_code,bk_lcode);
=======
	public ModelAndView bookDetailPage(String bk_code) { 
		mav=bm.bookDetailPage(bk_code);
>>>>>>> e15e5840ae1d8c8e517f14e4d8725f126a55ad17
		
		return mav;
		
	}
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybookinsert")
	public ModelAndView bookInsert(Books book) { //책 등록하는 메소드

		mav=lmm.bookInsert(book);
		
		return mav;
	}
	
	
}
