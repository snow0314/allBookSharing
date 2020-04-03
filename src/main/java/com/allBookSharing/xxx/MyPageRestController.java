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
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.service.MemberManagement;

@RestController
public class MyPageRestController {

	@Autowired
	MemberManagement mm;
	
	
	@RequestMapping(value = "/updatepassword" ,produces = "application/json;charset=UTF-8")
	public boolean updatePassword(Principal principal,String pw) {
		
		System.out.println("pw변경 컨트롤러");
		System.out.println("pw="+pw);
		boolean pwResult=mm.updatePassword(principal,pw);
		
		return pwResult;
	}
	
	//대출 건수
	@RequestMapping(value = "/borrowcnt" ,produces = "application/json;charset=UTF-8")
	public int getBorrowCnt(Principal principal) {
		
		System.out.println("대출 건수 컨트롤러");
		int borrowCnt=mm.getBorrowCnt(principal);
		
		return borrowCnt;
	}
	
	//연체 건수
	@RequestMapping(value = "/arrearscnt" ,produces = "application/json;charset=UTF-8")
	public int getArrearsCnt(Principal principal) {
		System.out.println("연체 건수 컨트롤러");
		int arrearsCnt=mm.getArrearsCnt(principal);
		
		return arrearsCnt;
	}
	
	//리뷰 건수
	@RequestMapping(value = "/reviewcnt" ,produces = "application/json;charset=UTF-8")
	public int getReviewCnt(Principal principal) {
		System.out.println("독서 횟수 컨트롤러");
		int reviewCnt=mm.getReviewCnt(principal);
		
		return reviewCnt;
	}

	//누적 연체일수
	@RequestMapping(value = "/arrearsday" ,produces = "application/json;charset=UTF-8")
	public int arrearsDay(Principal principal) {
		System.out.println("누적 연체 날짜 컨트롤러");
		int arrearsDay=mm.getArrearsDay(principal);
		
		return arrearsDay;
	}

	//대출현황
	@RequestMapping(value = "/loanlist" ,produces = "application/json;charset=UTF-8")
	public List<Loan> loanList(Principal principal) {
		System.out.println("대출현황 컨트롤러");
		List<Loan> lList=mm.getLoanList(principal);
		
		return lList;
	}
	//연체 목록
	@RequestMapping(value = "/arrearslist" ,produces = "application/json;charset=UTF-8")
	public List<Loan> arrearsList(Principal principal) {
		System.out.println("연체목록 컨트롤러");
		List<Loan> lList=mm.getArrearsList(principal);
		
		return lList;
	}
	
	
	//현재 예약 목록
	@RequestMapping(value = "/reservationlist" ,produces = "application/json;charset=UTF-8")
	public List<Reservation> reservationList(Principal principal) {
		System.out.println("현재 예약 목록 컨트롤러");
		List<Reservation> rList=mm.getReservationlist(principal);
		
		return rList;
	}
	
	
	//예약 순위 
	@RequestMapping(value = "/reservationrank" ,produces = "application/json;charset=UTF-8")
	public int reservationRank(Reservation res,Principal principal) {
		
		System.out.println("현재 예약 순위 컨트롤러");
		System.out.println("rv_lcode="+res.getRv_lcode());
		System.out.println("rv_code="+res.getRv_code());
		int rank=mm.getreservationRank(res,principal);
		
		return rank;
	}
	
	//현재 예약 취소 
	@RequestMapping(value = "/reservationcancell" ,produces = "application/json;charset=UTF-8")
	public boolean reservationcancell(int rv_num) {
		System.out.println("현재 예약 목록 컨트롤러");
		boolean result=mm.reservationcancell(rv_num);
		
		return result;
	}
	
	
	//대출 차트
	@RequestMapping(value = "/borrowchart" ,produces = "application/json;charset=UTF-8")
	public List<BigGroup> borrowChart(Principal principal) {
		System.out.println("대출차트 컨트롤러");
		List<BigGroup> bList=mm.getBorrowChart(principal);
		
		return bList;
	}
	//반납신청하기
	@RequestMapping(value = "/returnbooks" ,produces = "application/json;charset=UTF-8")
	public boolean returnBooks(int bd_num) {
		System.out.println("반납연장 컨트롤러");
		System.out.println("bd_bo_num="+bd_num);
		boolean result=mm.returnBooks(bd_num);
		
		return result;
	}
	
	
	//반납일 연장하기
		@RequestMapping(value = "/loanextend" ,produces = "application/json;charset=UTF-8")
		public boolean loanExtend(int bd_num) {
			System.out.println("반납연장 컨트롤러");
			System.out.println("bd_bo_num="+bd_num);
			boolean result=mm.loanExtend(bd_num);
			
			return result;
		}
		
		//희망도서 신청페이지 지역정보 가져오는 메소드
		@RequestMapping(value = "/getlocinfo" ,produces = "application/json;charset=UTF-8")
		public List<Library> getLocInfo() { 
			List<Library> list=mm.getLocInfo();
			
			return list;
		}
		//희망도서 신청페이지 지역정보 가져온뒤 도서관 보여주는 메소드
		@RequestMapping(value = "/getloclibray" ,produces = "application/json;charset=UTF-8")
		public List<Library> getLocLibray(String loc) { 
			List<Library> list=mm.getLocLibray(loc);
			
			return list;
		}
		//회원등급 변경
		@RequestMapping(value = "/changegrade" ,produces = "application/json;charset=UTF-8")
		public boolean changeGrade(Principal principal) { 
			boolean result=mm.changeGrade(principal);
			
			System.out.println("회원등급 결과="+result);
			return result;
		}
		//회원등급 변경 후 포인트 충전
		@RequestMapping(value = "/pluspoint" ,produces = "application/json;charset=UTF-8")
		public boolean plusPoint(Principal principal) { 
			boolean result=mm.plusPoint(principal);
			result=mm.plusPointList(principal);
			return result;
		}
		
}
