package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.BigGroup;
import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.service.MemberManagement;

@RestController
public class MyPageRestController {

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

	//누적 연체일수
	@RequestMapping(value = "/arrearsday" ,produces = "application/json;charset=UTF-8")
	public  int arrearsDay(Principal principal) {
		System.out.println("누적 연체 날짜 컨트롤러");
		int arrearsDay=mm.getArrearsDay(principal);
		
		return arrearsDay;
	}

	//대출현황
	@RequestMapping(value = "/loanlist" ,produces = "application/json;charset=UTF-8")
	public  List<Loan> loanList(Principal principal) {
		System.out.println("대출현황 컨트롤러");
		List<Loan> lList=mm.getLoanList(principal);
		
		return lList;
	}
	//연체 목록
	@RequestMapping(value = "/arrearslist" ,produces = "application/json;charset=UTF-8")
	public  List<Loan> arrearsList(Principal principal) {
		System.out.println("연체목록 컨트롤러");
		List<Loan> lList=mm.getArrearsList(principal);
		
		return lList;
	}
	
	//대출 차트
	@RequestMapping(value = "/borrowchart" ,produces = "application/json;charset=UTF-8")
	public  List<BigGroup> borrowChart(Principal principal) {
		System.out.println("대출차트 컨트롤러");
		List<BigGroup> bList=mm.getBorrowChart(principal);
		
		return bList;
	}
	
	//반납일 연장하기
		@RequestMapping(value = "/loanextend" ,produces = "application/json;charset=UTF-8")
		public  boolean loanExtend(int bd_bo_num) {
			System.out.println("반납연장 컨트롤러");
			System.out.println("bd_bo_num="+bd_bo_num);
			boolean result=mm.loanExtend(bd_bo_num);
			
			return result;
		}

}
