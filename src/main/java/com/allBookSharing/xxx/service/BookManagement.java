package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IBookDao;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Review;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class BookManagement {
  @Autowired
  private IBookDao bDao;
  ModelAndView mav;
  
	public List<Books> bookSearch(String bk_search, String selectval) {
		System.out.println("검색2");
		List<Books> bList=bDao.bookSearch(bk_search,selectval);
			
		return bList;
	}

	public ModelAndView bookDetailPage(String bk_code) {
		mav=new ModelAndView();
		String view=null;
		Books books=bDao.bookDetailPage(bk_code);
		mav.addObject("books",books);
		
		List<Review> review=bDao.bookReviewList(bk_code);
		mav.addObject("review", review);
		
		view="bookDetailPage";
		mav.setViewName(view);
		System.out.println("서비스 통과");
		return mav;
		
	}

}
