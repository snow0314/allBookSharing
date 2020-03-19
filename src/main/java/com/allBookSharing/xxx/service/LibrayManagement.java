package com.allBookSharing.xxx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.ILibrayManagementDao;
import com.allBookSharing.xxx.dto.Library;

@Service
public class LibrayManagement {

	@Autowired
	ILibrayManagementDao lDao;
	
	ModelAndView mav;
	
	//자기가 속한 도서관의 정보를 가져오는 메소드
	public Library getLibraryInfo(int lb_code) {
		
		Library library=lDao.getLibraryInfo(lb_code);
		
		return library;
	}

	//도서관 정보 수정하는 메소드
	public ModelAndView libraryModify(Library lib) {
		mav=new ModelAndView();
		System.out.println("수정 서비스");
		boolean result=lDao.libraryModify(lib);
		
		if(result) {
			mav.setViewName("librarian/libraryModify");
			mav.addObject("msg", "성공");
		}else {
			mav.setViewName("librarian/libraryModify");
			mav.addObject("msg", "실패");
		}
		
		return mav;
	}

}
