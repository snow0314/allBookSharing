package com.allBookSharing.xxx.service;


import java.io.File;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dao.IMemberDao;
import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.dto.PointList;
import com.google.gson.Gson;

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
	public String getLoanList(Principal principal) {
		String id=principal.getName();
		System.out.println("id="+id);
		List<Loan> lList=mDao.getLoanList(id);
		String json=new Gson().toJson(lList);
		return json;
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

	public ModelAndView profileComplet(MultipartHttpServletRequest multi, Principal principal) {
		mav = new ModelAndView();
		String id=principal.getName();
		
		BCryptPasswordEncoder pwdEncoder =new BCryptPasswordEncoder();
		// 1.이클립스의 물리적 저장경로 찾기
					String root = multi.getSession().getServletContext().getRealPath("/");
					System.out.println("root=" + root);
					String path = root + "profile/";
					System.out.println("path="+path);
					// 2.폴더 생성을 꼭 할것...
					File dir = new File(path);
					if (!dir.isDirectory()) { // upload폴더 없다면
						dir.mkdir(); // upload폴더 생성
					}
					// 파일 메모리에 저장
					MultipartFile mf=multi.getFile("us_image");
					String oriFileName = mf.getOriginalFilename(); // a.txt
					String sysFileName = System.currentTimeMillis() + "."
							+ oriFileName.substring(oriFileName.lastIndexOf(".") + 1);
		
					Member mb1=new Member();
					mb1.setMb_id(multi.getParameter("mb_id")).setMb_pw(pwdEncoder.encode(multi.getParameter("mb_pw"))).setMb_area(multi.getParameter("mb_area")).setMb_name(multi.getParameter("mb_name"))
	    		      .setUs_id(multi.getParameter("us_id")).setUs_address(multi.getParameter("us_address")).setUs_phone(multi.getParameter("us_phone")).setUs_email(multi.getParameter("us_email"))
	    		      .setUs_image(sysFileName);
					
					
						
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
		
		boolean result2=mDao.insertPointList(us_point,id);
		
		if(result && result2)
		mav.setViewName("redirect:/movemypage");
		else
		mav.setViewName("redirect:/insertpoint");
		
		
		
		return mav;
	}



	public ModelAndView pointList(Principal principal) {
		mav = new ModelAndView();
		String view= null;
		String id=principal.getName();
		
		List<PointList> pList=mDao.getPointList(id);
		String gson=new Gson().toJson(pList);
		
		System.out.println("p리스트는:"+pList);
		mav.addObject("list",gson);
		mav.setViewName(view);
		return mav;
	}
}
