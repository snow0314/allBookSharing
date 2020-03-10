package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.service.librayBookManagement;



@RestController
public class librayBookRestController {
	
	@Autowired
	librayBookManagement lmm;
	
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
	
}
