package com.allBookSharing.xxx;



import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.allBookSharing.xxx.service.BookManagement;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.service.librayBookManagement;

@Controller

public class librayBookController {


	@Autowired
	librayBookManagement lmm;
	
	ModelAndView mav;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/librarymain")
	public String libraryMain() { //사서 메인페이지 이동
		
		return "librarian/librarymain";
	}

	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybookinsertmove")
	public String bookInsertMove() { //책 등록 페이지 이동
		
		return "librarian/bookinsert";
	 } 
	@RequestMapping(value = "/movetotalsearch")
	public String movetotalSearch() {
		
		return "totalSearch";
	 } 
	@GetMapping(value="/bookdetailpage")
	public ModelAndView bookDetailPage(String bk_code) {
		mav=bm.bookDetailPage(bk_code);
		
		return mav;
		
	}
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybooklistmove")
	public String bookListMove() { //책 목록 페이지 이동
			
		return "librarian/bookslist";
	}
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraybookinsert")
	public ModelAndView bookInsert(Books book) {

		mav=lmm.bookInsert(book);
		
		return mav;
	}
	
	
}