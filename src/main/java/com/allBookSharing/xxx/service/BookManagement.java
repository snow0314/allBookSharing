package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IBookDao;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Liked;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.dto.Review;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class BookManagement {
  @Autowired
  private IBookDao bDao;
  ModelAndView mav;
  
	public List<Books> bookSearch(String bk_search, String selectval) {
		List<Books> bList=bDao.bookSearch(bk_search,selectval);
			
		return bList;
	}

	public ModelAndView bookDetailPage(String bk_code, String bk_lcode) {
		mav=new ModelAndView();
		String view=null;
		Books books=bDao.bookDetailPage(bk_code,bk_lcode);
		mav.addObject("books",books);
		
		List<Review> review=bDao.bookReviewList(bk_code);
		mav.addObject("review", review);
		
		view="bookDetailPage";
		mav.setViewName(view);
		
		return mav;
		
	}

	public Boolean reservationInsert(Reservation r) {
		
		System.out.println("서비스 통과");
		Boolean reservation=bDao.reservationInsert(r);
		
		return reservation;
	}

	public Integer reservationConfirm(Reservation r) {
		System.out.println("서비스");
		System.out.println("r2="+r.toString());
		Integer rvconfirm=bDao.reservationConfirm(r);
		System.out.println(rvconfirm);
		return rvconfirm;
	}

	public Boolean reservationCancel(Reservation r) {
		System.out.println("취소서비스");
		Boolean rvcancel=bDao.reservationCancel(r);
		System.out.println(rvcancel);
		return rvcancel;
	}
	
	public Integer likedConfirm(Liked lk) {
		Integer liconfirm=bDao.likedConfirm(lk);
		System.out.println("찜확인m결과="+liconfirm);
		return liconfirm;
	}

	public Boolean likeInsert(Liked lk) {
		Boolean lkinsert=bDao.likeInsert(lk);
		System.out.println("찜추가m결과="+lkinsert);
		return lkinsert;
	}

	public Boolean likeCancel(Liked lk) {
		Boolean lkcancel=bDao.likeCancel(lk);
		System.out.println("찜삭제m결과="+lkcancel);
		return lkcancel;
	}

	public Integer likeCount(Liked lk) {
		Integer lkcount=bDao.likeCount(lk);
		System.out.println("찜카운트m결과="+lkcount);
		return lkcount;
	}

	public Integer deliCount(DeliveryReq dr) {
		Integer delicount=bDao.deliCount(dr);
		System.out.println("배송신청카운트m결과"+delicount);
		return delicount;
	}

	public Boolean deliInsert(DeliveryReq dr) {
		Boolean deliinsert=bDao.deliInsert(dr);
		System.out.println("배송신청인서트m결과"+deliinsert);
		return deliinsert;
	}

	public List<Books> myRegionSearch(String bk_search, String selectval, String region) {
		List<Books> bList=bDao.myRegionSearch(bk_search,selectval,region);
		return bList;
	}

	public List<Library> myRegionLib(String bk_search, String selectval, String region) {
		List<Library> lbList=bDao.myRegionLib(bk_search,selectval,region);
		return lbList;
	}

	public List<Books> regionLibSearch(String bk_search, String selectval, Integer bk_lcode) {
		List<Books> lbsList=bDao.regionLibSearch(bk_search,selectval,bk_lcode);
		return lbsList;
	}

	public List<Books> jiyuckSearch(String bk_search, String selectval, String bk_loc) {
		List<Books> jiyList=bDao.jiyuckSearch(bk_search,selectval,bk_loc);
		return jiyList;
	}



	

}
