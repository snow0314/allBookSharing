package com.allBookSharing.xxx.service;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.allBookSharing.xxx.dto.BigGroup;
import com.allBookSharing.xxx.dto.Classification;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.LikedList;
import com.allBookSharing.xxx.dto.LikedList2;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.dto.PointList;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.dto.Review;
import com.google.gson.Gson;

@Service
public class MemberManagement {

	
	@Autowired
	IMemberDao mDao;
	private ModelAndView mav=new ModelAndView();
	
	
	
	
	//찜목록
	   public ModelAndView showWishList(Principal principal) {
	      mav = new ModelAndView();
	      String id=principal.getName();
	      String view=null;
	      List<LikedList> likeList= mDao.showWishList(id);
	      System.out.println(likeList.toString());
	      if(likeList!=null)
	      view="checkedlist";
	      else
	      view="redirect:/movemypage";
	      
	      String json=new Gson().toJson(likeList);
	      mav.addObject("likeList",json);
	      mav.setViewName(view);
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

	//리뷰 횟수
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
		int arrearsDay=0;
		arrearsDay=mDao.getArrearsDay(id)*-1;
		
		
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
		System.out.println("연체목록 : "+lList);
		return lList;
	}
	
	
	//비밀번호 변경
	public boolean updatePassword(Principal principal, String pw) {
		String id=principal.getName();
		boolean result=mDao.updatePassword(id,pw);
		
		return result;
	}

	//내정보수정하기
	public ModelAndView profileComplet(MultipartHttpServletRequest multi, Principal principal) {
		mav = new ModelAndView();
		String id=principal.getName();
		String view=null;
		
		BCryptPasswordEncoder pwdEncoder =new BCryptPasswordEncoder();
		// 1.이클립스의 물리적 저장경로 찾기
					String root = multi.getSession().getServletContext().getRealPath("/");
					System.out.println("root=" + root);
					String path ="C:/img/profile/";
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
					
					try {
						mf.transferTo(new File(path + sysFileName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					boolean result1=mDao.updateprofileUs(mb1);
					boolean result2=mDao.updateprofileMb(mb1);
					//Member mb=mDao.getMyPage(id);
					if(result1&&result2) {
						view="redirect:/movemypage";
					}
					else {
						view="redirect:/movemypage";
					}
					
						
		
		//mav.addObject("mb",mb);
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView okPoint(Member mb, Principal principal) {
	      mav = new ModelAndView();
	      String id=principal.getName();

	      mb.setMb_id(id);
	      
	      boolean result= mDao.updateOkPoint(mb);
	      
	      boolean pl=mDao.insertPointList(mb);
	      
	      if(result && pl)
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

	public ModelAndView memberDrop(Principal principal) {
		String id=principal.getName();
		String view= null;
		
		boolean result=mDao.memberDrop(id);
		boolean result2=mDao.memberDrop2(id);
		boolean result3=mDao.memberDrop3(id);
		
		if(result&&result2&&result3) {
			view="redirect:/loginfrm";
		}
		else {
			view="redirect:/movemypage";
		}
		
		mav.setViewName(view);
		return mav;
	}

	//대출차트
	public List<BigGroup> getBorrowChart(Principal principal) {
		String id=principal.getName();
		
		List<BigGroup> bList=mDao.getBorrowChart(id);
		System.out.println("bList="+bList);
		
		
		return bList;
	}
  
	public String myRegion(Principal p) {
		System.out.println("지역2");
		String id=p.getName();
	
		String result=mDao.myRegion(id);
		
		return result;

	}
	//반납일 연장하기
	public int loanExtend(int bd_bo_num) {
		
		int bd_return_extension=mDao.loanExtend(bd_bo_num);
		System.out.println("bd_return_extension="+bd_return_extension);
		
		return bd_return_extension;
	}

	//현재 예약 목록
	public List<Reservation> getReservationlist(Principal principal) {
		String id=principal.getName();
		
		List<Reservation> rList=mDao.getReservationlist(id);
		System.out.println("rList="+rList);
		
		return rList;
	}

	   //찜목록 삭제
	   public String deletelikedList(List<LikedList> likedList, Principal p) {
	      
	      int result=0;
	      List<LikedList2> list3= new ArrayList<LikedList2>();
	      
	      for(int i=0;i<likedList.size();i++) {
	         LikedList2 list2=new LikedList2();
	         list2.setLb_code(likedList.get(i).getLb_code())
	         .setBk_code(likedList.get(i).getBk_code()).setId(p.getName());
	         list3.add(list2);
	      }
	      
	      
	      
	      
	      
	      result=mDao.deletLikedList(list3);
	      
	      System.out.println("찜목록 삭제:"+result);
	      
	      if(result!=0) {
	         return "삭제 성공";  
	      }else {
	         return "삭제실패";
	      }
	      
	   }	//찜목록 삭제 end
	   

	 //마이페이지에서 예약 취소
	public boolean reservationcancell(int rv_num) {

		boolean result=mDao.reservationcancell(rv_num);
		
		return result;
	}

	//희망도서 신청에서 지역 정보 가져오는 메소드
	public List<Library> getLocInfo() {
		List<Library> list=mDao.getLocInfo();
		return list;
	}
	//희망도서 지역정보 가져온뒤 부합하는 도서관 보여주는 메소드
	public List<Library> getLocLibray(String loc) {
		List<Library> list=mDao.getLocLibray(loc);
		return list;
	}
	//예약 순위
	public int getreservationRank(int rv_num) {

		int rank=mDao.getreservationRank(rv_num);
		
		return rank;
	}
	
	//한줄평 쓰기
	public ModelAndView reviewInsert(Review review) {
		mav = new ModelAndView();
		System.out.println("한줄평2");
		int result = mDao.reviewInsert(review);
		if(result !=0) {
			mav.setViewName("redirect:/moveloanlist");
			mav.addObject("msg", "한줄평 등록에 성공하셨습니다.");
		}else {
			mav.setViewName("redirect:/moveloanlist");
			mav.addObject("msg", "한줄평 등록에 실패하셨습니다.");
		}
	    
		return mav;
	}
    
	
	/*
	 * //로그인 정보 표시 public ModelAndView loginInfo(Principal principal) { mav = new
	 * ModelAndView(); String id= principal.getName();
	 * 
	 * Member mb=mDao.loginInfo(id);
	 * 
	 * mav.addObject("member", mb); mav.setViewName("index");
	 * 
	 * return mav; }
	 */
}
