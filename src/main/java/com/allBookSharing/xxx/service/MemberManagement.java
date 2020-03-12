package com.allBookSharing.xxx.service;


import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dao.IMemberDao;
import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Member;

@Service
public class MemberManagement {

	
	@Autowired
	IMemberDao mDao;
	private ModelAndView mav=new ModelAndView();
	
	
	
	
	//찜목록
	public ModelAndView showWishList(HttpServletRequest req) {
		mav = new ModelAndView();
		
		mav.setViewName("checkedlist");
		return mav;
	}

	//마이페이지 이동(내정보불러오기)
	public ModelAndView moveMypage(Principal principal) {
		mav = new ModelAndView();
		
		String id=principal.getName();
		System.out.println("id="+id);
		
		Member mb=mDao.getMyPage(id);
		mav.addObject("mb",mb);
		mav.setViewName("myPage");
		return mav;
	}

	//내정보수정하기페이지
	public ModelAndView modifyprofile(Principal principal) {
		mav = new ModelAndView();
		String id=principal.getName();		
		System.out.println("id="+id);
		Member mb=mDao.getMyPage(id);
		mav.addObject("mb",mb);
		mav.setViewName("myInfoModify");
		return mav;
	}

	//대출횟수
	public int getBorrowCnt(Principal principal) {
		String id=principal.getName();
		System.out.println("id="+id);
		
		int cnt=mDao.getBorrowCnt(id);
		
		return cnt;
	}

	//연체횟수
	public int getArrearsCnt(Principal principal) {
		String id=principal.getName();
		System.out.println("id="+id);
		
		int cnt=0;
		cnt=mDao.getArrearsCnt(id);
		
		System.out.println("cnt="+cnt);
			
		return cnt;
	}

	
	public int getReviewCnt(Principal principal) {
		String id=principal.getName();
		System.out.println("id="+id);
		
		int cnt=mDao.getReviewcntCnt(id);
		return cnt;
	}

	public int getArrearsDay(Principal principal) {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
//		User username = (User) authentication.getPrincipal();
//		System.out.println("user="+username.getUsername());
//		System.out.println("id="+id);
		String id=principal.getName();
		System.out.println("id="+id);
		
		//누적 연체일수
		int arrearsDay=mDao.getArrearsDay(id)*-1;
		
		System.out.println("연체 일수 ="+arrearsDay);
		
		
		return arrearsDay;
	}

	//대출현황
	public List<Loan> getLoanList(Principal principal) {
		String id=principal.getName();
		System.out.println("id="+id);
		List<Loan> lList=mDao.getLoanList(id);
		return lList;
	}

	//연체목록
	public List<Loan> getArrearsList(Principal principal) {
		String id=principal.getName();
		System.out.println("id="+id);
		List<Loan> lList=mDao.getArrearsList(id);
		return lList;
	}
	
	
	//비밀번호 변경
	public boolean updatePassword(Principal principal, String pw) {
		String id=principal.getName();
		boolean result=mDao.updatePassword(id,pw);
		
		return result;
	}

	public ModelAndView profileComplet(Principal principal, Member mb1) {
		mav = new ModelAndView();
		String id=principal.getName();
		mDao.updateprofileUs(mb1);
		mDao.updateprofileMb(mb1);
		
		Member mb=mDao.getMyPage(id);
		mav.addObject("mb",mb);
		
		mav.setViewName("myPage");
		return mav;
	}

	public ModelAndView okPoint(Member mb, Principal principal) {
		mav = new ModelAndView();
		String id=principal.getName();
		System.out.println("point="+ mb.getUs_point());
		int us_point=mb.getUs_point();
		boolean result= mDao.updateOkPoint(us_point,id);
		
		if(result)
		mav.setViewName("redirect:/movemypage");
		else
		mav.setViewName("redirect:/insertpoint");
		
		
		
		return mav;
	}
}
