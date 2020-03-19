package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.validator.constraints.ISBN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.service.BookManagement;
import com.allBookSharing.xxx.service.LibrarianManagement;

@RestController

public class AdminRestController {
	@Autowired
	private LibrarianManagement la;
	
	ModelAndView mav;

	@RequestMapping(value = "/getlibraryinfo", produces = "application/json;charset=UTF-8")
	public List<Library> getLibraryInfo() {
		List<Library> lib = la.getlibraryinfo();
		return lib;
	}
	@RequestMapping(value = "/librariandelete", produces = "application/json;charset=UTF-8")
	public String LibrarianDelete(String la_id) {
		
		String result= la.LibrarianDelete(la_id);

		return result;
	}

}
