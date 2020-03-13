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
import com.allBookSharing.xxx.dto.Liked;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.service.BookManagement;

@RestController

public class BookRestController {
	@Autowired
	private BookManagement bm;
	ModelAndView mav;
	
	@GetMapping(value="/booksearch",produces="application/json;charset=UTF-8")
	public List<Books> bookSearch(String bk_search,String selectval) {
		System.out.println("검색1");
		System.out.println(bk_search);
		System.out.println(selectval);
		
		List<Books> bList=bm.bookSearch(bk_search,selectval);
		return bList;
	} 
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/reservation",produces="application/json;charset=UTF-8")
	public String reservationInsert(Reservation r,Principal p) {
		r.setRv_id(p.getName());
		Boolean result= bm.reservationInsert(r);
		if(result) {
			return "성공";
		}else{
		
		return "실패";}
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/reservationconfirm",produces="application/json;charset=UTF-8")
	public String reservationConfirm(Reservation r,Principal p) {
		System.out.println("컨드롤");
		System.out.println("r="+r.toString());
		System.out.println("id="+p.getName());
		r.setRv_id(p.getName());
		System.out.println("id2="+r.getRv_id());
		Integer result=bm.reservationConfirm(r);
		if(result==1) {
			return "성공";
		}else {
			return "실패";
			}
		
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/reservationcancel",produces="application/json;charset=UTF-8")
	public Boolean reservationCancel(Reservation r,Principal p) {
		r.setRv_id(p.getName());
		System.out.println("cc r="+r.toString());
		Boolean result=bm.reservationCancel(r);

		return result;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/likeinsert",produces="application/json;charset=UTF-8")
	public Boolean likeInsert(Liked lk,Principal p) {
		lk.setLk_id(p.getName());
		
		System.out.println("lk="+lk.toString());
		Boolean result=bm.likeInsert(lk);

		return result;
	}

}
