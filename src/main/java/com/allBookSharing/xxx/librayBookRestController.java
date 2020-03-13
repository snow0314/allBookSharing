package com.allBookSharing.xxx;

import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.service.librayBookManagement;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@RestController
public class librayBookRestController {
	
	@Autowired
	librayBookManagement lmm;
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
	
	@RequestMapping(value = "/getbiggroup" ,produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Classification> getBigGroup() {
		
		List<Classification> blist=lmm.getBigGroup();
		
		return blist;
	}
	
	
	@RequestMapping(value = "/getsmallgroup" ,produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Classification> getSmallGroup(Integer bigNum) {
		
		List<Classification> blist=lmm.getSmallGroup(bigNum);
		
		return blist;
	}
	
	@Secured("ROLE_LIBRARIAN")	
	@RequestMapping(value = "/libraybooklist")
	public List<Books> getBookList(Principal principal) { //책 목록 가져오기
		
		return lmm.getBookList(principal);
	}	
	
	
	@Secured("ROLE_LIBRARIAN")	
	@RequestMapping(value = "/getlibraycode")
	public Map<String, Object> getLibrayCode(Principal principal) { //도서관 코드,이름 가져오기
		
		return lmm.getLibrayCodeName(principal);
	}
	
	@Secured("ROLE_LIBRARIAN")	
	@RequestMapping(value = "/libraybookdelete" ,produces = "application/json;charset=UTF-8")
	public String deleteBooks(@RequestBody String json) throws JsonParseException, JsonMappingException, IOException { 
		ObjectMapper mapper =new ObjectMapper();
		List<Books> bookList = Arrays.asList(mapper.readValue(json, Books[].class));
		System.out.println("책 리스트:"+bookList.toString());
		
		
		return lmm.deleteBooks(bookList);
	}
	
}
