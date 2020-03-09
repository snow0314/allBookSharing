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
	
	//@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/libraybookinsertmove")
	public String bookInsertMove() {
		
		return "librarian/bookinsert";
	}
	
	
	@RequestMapping(value = "/libraybookinsert")
	public ModelAndView bookInsert(Books book) {
		System.out.println("책 등록1");
		System.out.println("book="+book.toString());

		mav=lmm.bookInsert(book);
		
		return mav;
	}
	
}
