package com.allBookSharing.xxx;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.activation.CommandMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Librarian;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.service.AdminManagement;
import com.allBookSharing.xxx.service.LibrarianManagement;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	ModelAndView mav;
	
	@Autowired
	AdminManagement am;
	@Autowired
	LibrarianManagement lm;
	
	 //관리자 메인화면
	 @RequestMapping(value ="/adminmain", method = RequestMethod.GET) 
	 public String adminindex() throws Exception {

		 return "admin/adminindex";
	 }
	 
	 //도서관 등록 페이지 이동
	 @RequestMapping(value = "/libraryinsertmove")
		public String libraryinsertmove() {
			
			return "admin/libraryinsert";
		}
	 
	 //도서관 등록 페이지
	 @RequestMapping(value="/libraryinsert")
	 public ModelAndView libraryinsert(Library lib) {
			System.out.println(lib.toString());
			mav=am.libraryinsert(lib);
			return mav;
		}
	 
	//사서 등록 페이지 이동
	 @RequestMapping(value = "/librarianinsertmove")
		public String librarianinsertmove() {
			
			return "admin/librarianinsert";
		}
	 
	 //사서 등록
	 @RequestMapping(value="/librarianinsert")
	 	public ModelAndView librarianinsert(Librarian lia) {
		 System.out.println(lia.toString());
		 mav=lm.librarianinsert(lia);
		 return mav;
	 }	 
	//사서 수정 페이지 이동
		 @RequestMapping(value = "/librarylistmove")
		 public ModelAndView getLibraryList() {
			
			 mav=am.getLibraryList();
			 
				return mav;
			}
		 
	
		 
}



