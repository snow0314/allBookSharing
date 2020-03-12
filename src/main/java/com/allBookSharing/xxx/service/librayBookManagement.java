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

	public String deleteBooks(List<Books> bookList) {
		
		int result = lDao.deleteBooks(bookList);
		
		return null;
	}

}
