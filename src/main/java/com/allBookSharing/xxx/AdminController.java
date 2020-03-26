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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Librarian;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Notice;
import com.allBookSharing.xxx.dto.Question;
import com.allBookSharing.xxx.dto.Recommend;
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
	 
	 //관리자 공지사항 페이지 이동
	 @Secured("ROLE_ADMIN")
	 @RequestMapping(value="/adminnotice")
	 public ModelAndView adminnotice() {
			mav=am.adminNotice();
			return mav;
		}
	 
	//공지사항 글쓰기 페이지 이동
	    @Secured("ROLE_ADMIN")
		@PostMapping(value = "/movenoticewrite")
		public ModelAndView movenoticeWrite() {
			
			ModelAndView mav=new ModelAndView();
			mav=am.movenoticeWrite();
			
			 
			return mav;
		}
		
	//공지사항 글 쓰기
	    @Secured("ROLE_ADMIN")
		@PostMapping(value="noticewrite")
		public ModelAndView noticeWrite(Notice nte,Principal principal) {
			
			ModelAndView mav=new ModelAndView();
			mav=am.noticeWrite(nte,principal);
			
			return mav;
		}
	    //공지사항 글 상세보기
	    @PostMapping(value="nopwdetail")
	    public ModelAndView noticePwDetail(Notice ntc) {
	    	
	    	ModelAndView mav=new ModelAndView();
	    	
	    	mav=am.noticeDetail(ntc);
	    	
	    	return mav;
	    }
	 
	//사서 등록 페이지 이동
	    @Secured("ROLE_ADMIN")
	 @RequestMapping(value = "/librarianinsertmove")
		public String librarianinsertmove() {
			
			return "admin/librarianinsert";
		}
	 
	 //사서 등록
	    @Secured("ROLE_ADMIN")
	 @RequestMapping(value="/librarianinsert")
	 	public ModelAndView librarianinsert(Librarian lia) {
		 System.out.println(lia.toString());
		 mav=lm.librarianinsert(lia);
		 return mav;
	 }	 
	//사서 수정 페이지 이동
	    @Secured("ROLE_ADMIN")
		 @RequestMapping(value = "/librarylistmove")
		 public ModelAndView getLibraryList() {
			System.out.println("사서수정페이지 이동 컨트롤러");
			 mav=am.getLibraryList();
			 
				return mav;
			}
	    
	  //추천도서 등록 페이지 이동
	    @Secured("ROLE_ADMIN")
		 @RequestMapping(value = "/recommendinsertmove")
		 public String recommendPageMove() {
			System.out.println("추천도서등록페이지 이동 컨트롤러");
			
			 
				return "admin/recommendInsert";
			}
	    
	    //추천도서 등록
	    @Secured("ROLE_ADMIN")
		 @RequestMapping(value = "/recommendinsert")
		 public ModelAndView recommendInsert(Recommend recommend) {
			System.out.println("추천도서등록");
			System.out.println("추천도서 정보:"+recommend.toString());
			mav=am.recommendInsert(recommend);
			 
				return mav;
			}

}



