package com.allBookSharing.xxx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.service.librayBookManagement;

@Controller
public class librayBookController {
	
	@Autowired
	librayBookManagement lmm;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/librarymain")
	public String libraryMain() { //사서 메인페이지 이동
		
		return "librarian/librarymain";
	}
	
	//@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/libraybookinsertmove")
	public String bookInsertMove() { //책 등록 페이지 이동
		
		return "librarian/bookinsert";
	}
	
	//@PreAuthorize("isAnonymous()")
		@RequestMapping(value = "/libraybooklistmove")
		public String bookListMove() { //책 등록 페이지 이동
			
			return "librarian/bookslist";
		}
	
	
	@RequestMapping(value = "/libraybookinsert")
	public ModelAndView bookInsert(Books book) {
		System.out.println("책 등록1");
		System.out.println("book="+book.toString());

		mav=lmm.bookInsert(book);
		
		return mav;
	}
	
	
	
}
