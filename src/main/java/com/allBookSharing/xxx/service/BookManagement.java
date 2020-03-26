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
import com.allBookSharing.xxx.dto.Loan;
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
		
		Review rvgrade=bDao.bookRvGrade(bk_code);
		mav.addObject("rvgrade",rvgrade);
		
		view="bookDetailPage";
		mav.setViewName(view);
		
		return mav;
		
	}

	public Boolean reservationInsert(Reservation r) {
		
		System.out.println("�꽌鍮꾩뒪 �넻怨�");
		Boolean reservation=bDao.reservationInsert(r);
		
		return reservation;
	}

	public Integer reservationConfirm(Reservation r) {
		System.out.println("�꽌鍮꾩뒪");
		System.out.println("r2="+r.toString());
		Integer rvconfirm=bDao.reservationConfirm(r);
		System.out.println(rvconfirm);
		return rvconfirm;
	}

	public Boolean reservationCancel(Reservation r) {
		System.out.println("痍⑥냼�꽌鍮꾩뒪");
		Boolean rvcancel=bDao.reservationCancel(r);
		System.out.println(rvcancel);
		return rvcancel;
	}
	
	public Integer likedConfirm(Liked lk) {
		Integer liconfirm=bDao.likedConfirm(lk);
		System.out.println("李쒗솗�씤m寃곌낵="+liconfirm);
		return liconfirm;
	}

	public Boolean likeInsert(Liked lk) {
		Boolean lkinsert=bDao.likeInsert(lk);
		System.out.println("李쒖텛媛�m寃곌낵="+lkinsert);
		return lkinsert;
	}

	public Boolean likeCancel(Liked lk) {
		Boolean lkcancel=bDao.likeCancel(lk);
		System.out.println("李쒖궘�젣m寃곌낵="+lkcancel);
		return lkcancel;
	}

	public Integer likeCount(Liked lk) {
		Integer lkcount=bDao.likeCount(lk);
		System.out.println("李쒖뭅�슫�듃m寃곌낵="+lkcount);
		return lkcount;
	}

	public Integer deliCount(DeliveryReq dr) {
		Integer delicount=bDao.deliCount(dr);
		System.out.println("諛곗넚�떊泥�移댁슫�듃m寃곌낵"+delicount);
		return delicount;
	}

	public Boolean deliInsert(DeliveryReq dr) {
		Boolean deliinsert=bDao.deliInsert(dr);
		System.out.println("諛곗넚�떊泥��씤�꽌�듃m寃곌낵"+deliinsert);
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
		System.out.println("jiyList="+jiyList);
		return jiyList;
	}

	public ModelAndView bestTopTen(Loan l) {
		mav=new ModelAndView();
		String view=null;
		
		List<Loan> topList=bDao.bestList(l);
		mav.addObject("topList", topList);
		
		view="popular";
		mav.setViewName(view);
		
		return mav;
		
	}

	public ModelAndView topDetailPage(String bk_code) {
		mav=new ModelAndView();
		String view=null;
		Books books=bDao.topDetailPage(bk_code);
		mav.addObject("books",books);
		
		List<Review> review=bDao.bookReviewList(bk_code);
		mav.addObject("review", review);
		
		view="topDetailPage";
		mav.setViewName(view);
		
		return mav;
	}

	
	public List<Loan> mainPageTopTen(Loan lo) {
		List<Loan> ttList=bDao.mainPageTopTen(lo);
		return ttList;
	}



	

}
