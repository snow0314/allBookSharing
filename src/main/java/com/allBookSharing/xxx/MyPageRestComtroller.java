package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.service.MemberManagement;

@RestController
public class MyPageRestComtroller {

	@Autowired
	MemberManagement mm;
	
	
	@RequestMapping(value = "/updatepassword" ,produces = "application/json;charset=UTF-8")
	public  boolean updatePassword(Principal principal,String pw) {
		
		System.out.println("pw변경 컨트롤러");
		System.out.println("pw="+pw);
		boolean pwResult=mm.updatePassword(principal,pw);
		
		return pwResult;
	}
	
	
	@RequestMapping(value = "/borrowcnt" ,produces = "application/json;charset=UTF-8")
	public  int getBorrowCnt(Principal principal) {
		
		System.out.println("대출 건수 컨트롤러");
		int borrowCnt=mm.getBorrowCnt(principal);
		
		return borrowCnt;
	}
	
	
	@RequestMapping(value = "/arrearscnt" ,produces = "application/json;charset=UTF-8")
	public  int getArrearsCnt(Principal principal) {
		System.out.println("연체 건수 컨트롤러");
		int arrearsCnt=mm.getArrearsCnt(principal);
		
		return arrearsCnt;
	}
	
	@RequestMapping(value = "/reviewcnt" ,produces = "application/json;charset=UTF-8")
	public  int getReviewCnt(Principal principal) {
		System.out.println("독서 횟수 컨트롤러");
		int reviewCnt=mm.getReviewCnt(principal);
		
		return reviewCnt;
	}

	
	@RequestMapping(value = "/arrearsday" ,produces = "application/json;charset=UTF-8")
	public  int arrearsDay(Principal principal) {
		System.out.println("누적 연체 날짜 컨트롤러");
		int arrearsDay=mm.getArrearsDay(principal);
		
		return arrearsDay;
	}
	
	@RequestMapping(value = "/loanlist" ,produces = "application/json;charset=UTF-8")
	public  List<Loan> loanList(Principal principal) {
		System.out.println("대출현황 컨트롤러");
		List<Loan> lList=mm.getLoanList(principal);
		
		return lList;
	}
	
	@RequestMapping(value = "/arrearslist" ,produces = "application/json;charset=UTF-8")
	public  List<Loan> arrearsList(Principal principal) {
		System.out.println("연체목록 컨트롤러");
		List<Loan> lList=mm.getArrearsList(principal);
		
		return lList;
	}

}
