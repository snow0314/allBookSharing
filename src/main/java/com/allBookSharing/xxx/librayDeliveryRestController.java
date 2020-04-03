package com.allBookSharing.xxx;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.LibraryDelivery;
import com.allBookSharing.xxx.service.LibraryDeliveryManagement;

@RestController
public class librayDeliveryRestController {
	
	
	@Autowired
	LibraryDeliveryManagement ldm;
	
	//사서가 보는 배송 상세
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/lbdeliverydetail")
	public List<LibraryDelivery> lbDeliveryDetail(HttpServletRequest req,LibraryDelivery ld) { //배송 관리 페이지 이동
		
		List<LibraryDelivery> deliveryDetail=ldm.lbDeliveryDetail(req,ld);
		
		return deliveryDetail;
		
	}
	
	
	//사서가 보는 배송 책 취소
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/lbdeliverycancel")
	public boolean lbDeliveryCancel(LibraryDelivery ld) { //배송 관리 페이지 이동
		
		boolean deliveryCancel=ldm.lbDeliveryCancel(ld);
		
		return deliveryCancel;
		
	}

	
	//반납신청 책 상세보기
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/returnbooksdetail")
	public LibraryDelivery returnBooksDetail(HttpServletRequest req,LibraryDelivery ld) { //배송 관리 페이지 이동
		
		LibraryDelivery returnBooksDetail=ldm.returnbooksdetail(req,ld);
		
		return returnBooksDetail;
		
	}
	
	
}
