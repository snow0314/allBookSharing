package com.allBookSharing.xxx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.service.BookManagement;

@Controller

public class librayBookController {
	@Autowired
	private BookManagement bm;
	ModelAndView mav;
	
	//@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/libraybookinsertmove")
	public String bookInsertMove() {
		
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
	
	
}
