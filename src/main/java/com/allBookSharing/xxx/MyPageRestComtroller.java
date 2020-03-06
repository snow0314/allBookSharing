package com.allBookSharing.xxx;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.service.MemberManagement;

@RestController
public class MyPageRestComtroller {

	@Autowired
	MemberManagement mm;
	
	@RequestMapping(value = "/borrowcnt" ,produces = "application/json;charset=UTF-8")
	public  int getBorrowCnt() {
		
		System.out.println("대출 건수 컨트롤러");
		int borrowCnt=mm.getBorrowCnt();
		
		return borrowCnt;
	}
	
	
	@RequestMapping(value = "/arrearscnt" ,produces = "application/json;charset=UTF-8")
	public  int getArrearsCnt() {
		System.out.println("연체 건수 컨트롤러");
		int arrearsCnt=mm.getArrearsCnt();
		
		return arrearsCnt;
	}
	
	@RequestMapping(value = "/reviewcnt" ,produces = "application/json;charset=UTF-8")
	public  int getReviewCnt() {
		System.out.println("독서 횟수 컨트롤러");
		int ReviewCnt=mm.getReviewCnt();
		
		return ReviewCnt;
	}
	
	
	
	
	

}
