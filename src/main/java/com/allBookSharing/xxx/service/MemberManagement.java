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
		System.out.println("누적연체일수 ㄱㄱ");
		Integer arrearsDay=0;
		arrearsDay=mDao.getArrearsDay(id);
		if(arrearsDay==null)
			arrearsDay=0;
		else if(arrearsDay<0)
			arrearsDay=arrearsDay*-1;
		else
			arrearsDay=0;
		
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
					String path ="K:\\springWork\\allBookSharing\\upload\\";
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
	public List<Loan> loanExtend(int bd_num, Principal principal) {
		String id=principal.getName();
		System.out.println("반납연장 서비스");
		boolean result=mDao.loanExtend(bd_num);
		List<Loan> lList=null;
		
		if(result) {
			System.out.println("반납연장후 리스트");
			 lList=mDao.getLoanList(id);
		}
		
		System.out.println("bd_return_extension="+result);
		
		return lList;
	}

	//현재 예약 목록
	public List<Reservation> getReservationlist(Principal principal) {
		String id=principal.getName();
		
		List<Reservation> rList=mDao.getReservationlist(id);
		for(int i=0;i<rList.size();i++) {
			rList.get(i).setReservationCnt(mDao.getReservationCnt(rList.get(i))); //해당 책에 예약이 몇건 걸려있는지 알아오는 메소드
		}
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
	public List<Loan> reservationcancell(int rv_num, Principal principal) {
		String id=principal.getName();

		boolean result=mDao.reservationcancell(rv_num);
		List<Loan> lList=null;
		if(result)
			lList=mDao.getLoanList(id);
		
		return lList;
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
	public int getreservationRank(Reservation res, Principal principal) {
		res.setRv_id(principal.getName());
		int rank=mDao.getreservationRank(res);
		
		return rank;
	}
	
	//한줄평 쓰기
	public ModelAndView reviewInsert(Review review) {
		int result;
		mav = new ModelAndView();
		System.out.println("한줄평2");
		int cnt = mDao.reviewSearch(review);
		if(cnt == 0) {
			result = mDao.reviewInsert(review);
			if(result !=0) {
				mav.setViewName("redirect:/moveloanlist");
				mav.addObject("msg", "한줄평 등록에 성공하셨습니다.");
			}else {
				mav.setViewName("redirect:/moveloanlist");
				mav.addObject("msg", "한줄평 등록에 실패하셨습니다.");
			}
		}else {
			result = mDao.reviewModify(review);
			mav.setViewName("redirect:/moveloanlist");
			mav.addObject("msg", "한줄평을 수정하셨습니다.");
		}
		
	    
		return mav;
	}
	//회원등급변경
	public boolean changeGrade(Principal principal) {
		String id=principal.getName();
		System.out.println("회원등급변경아이디="+id);
		Boolean result=mDao.changeGrade(id);
		return result;
	}

	public boolean plusPoint(Principal principal) {
		String id=principal.getName();
		Boolean result=mDao.plusPoint(id);
		
		System.out.println("포인트서비스="+result);
		return result;
	}

	public boolean plusPointList(Principal principal) {
		String id=principal.getName();
		Boolean result=mDao.plustPointList(id);
		return result;
	}

	//반납신청하기
	public List<Loan> returnBooks(int bd_num, Principal principal) {
		String id=principal.getName();
		
		Boolean result=mDao.returnBooks(bd_num);
		List<Loan> lList=null;
		if(result)
			lList=mDao.getLoanList(id);
		
		return lList;
		
	}
    
	public int deliveryListInsert(List<LikedList> lList) {
		int result = 0;
		boolean check;
		for(int i=0;i<lList.size();i++) {
			check = mDao.deliveryListCheck(lList.get(i));
			if(check) {
				continue;
			}
			result += mDao.deliveryListInsert(lList.get(i));
		}
		
		
		
		return result;
	}
	

	
}
