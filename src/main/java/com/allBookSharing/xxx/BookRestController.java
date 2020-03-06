package com.allBookSharing.xxx;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.service.BookManagement;

@RestController

public class BookRestController {
	@Autowired
	private BookManagement bm;
	ModelAndView mav;
	
	@GetMapping(value="/booksearch",produces="application/json;charset=UTF-8")
	public List<Books> bookSearch(String bk_search) {
		System.out.println("검색1");
		List<Books> bList=bm.bookSearch(bk_search);
		return bList;
	} 

}
