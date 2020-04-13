package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IlibrayBookManagementDao;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Classification;

@Service
public class librayBookManagement {

	@Autowired
	IlibrayBookManagementDao lDao;
	
	ModelAndView mav;

	public List<Classification> getBigGroup() {
		
		List<Classification> bList=lDao.getBigGroup();
		
		return bList;
	}

	public List<Classification> getSmallGroup(Integer bigNum) {
		
	
		
		List<Classification> sList=lDao.getSmallGroup(bigNum);
		
		return sList;
	}

	public ModelAndView bookInsert(Books book) {
		
		boolean result=lDao.bookInsert(book);
		mav=new ModelAndView();
		
		if(result) {
			mav.addObject("bookInsertMsg", "true");
			mav.setViewName("redirect:libraybookinsertmove");
		}else {
			mav.addObject("bookInsertMsg", "false");
			mav.setViewName("redirect:libraybookinsertmove");
		}
		
		
		return mav;
	}

	public List<Books> getBookList(Principal principal) { //도서관 코드만 조회
		String id=principal.getName();
		int LibraryCode=lDao.getLibraryCode(id);
		//System.out.println("사서 도서관코드:"+LibraryCode);
		List<Books> bList=lDao.getBookList(LibraryCode);
		//System.out.println("도서관 책 목록:"+bList.toString());
		
		return bList;
	}

	public Map<String, Object> getLibrayCodeName(Principal principal) { //도서관 코드, 이름 조회
		String id=principal.getName();
		Map<String, Object> lMap=lDao.getLibrayCodeName(id);
		return lMap;
	}

	/*
	 * 1. 찜 목록에서 삭제 
	 * 2.예약 목록에서 삭제 
	 * 3.도서관 책 삭제 (완료)
	 */
	public String deleteBooks(List<Books> bookList) {
		
		int result=0;
		
		result = lDao.deleteBooks(bookList);
		
		
		System.out.println("도서삭제 result="+result);
		
		if(result!=0) {
			return "삭제 성공";
		}else {
			return "삭제 실패";
		}
		
	}
	
	//책 정보 가져오는 메소드
	public Books getLibrayBookInfo(Books book) {
		
		
		return lDao.getLibrayBookInfo(book);
	}
	
	//책 수정하는 메소드
	public ModelAndView librayBookModify(Books book) {
		int result = lDao.librayBookModify(book);
		mav = new ModelAndView();
		
		if(result != 0) {
			mav.setViewName("librarian/bookslist");
			mav.addObject("msg", "수정에 성공하셨습니다.");
		}else {
			mav.setViewName("librarian/bookslist");
			mav.addObject("msg", "수정에 실패하셨습니다.");
		}
		
		return mav;
	}

}
