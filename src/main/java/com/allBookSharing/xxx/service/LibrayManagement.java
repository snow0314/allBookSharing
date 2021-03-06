package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.ILibrayManagementDao;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Schedule;

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

	public List<Schedule> getLibraryCalendarInfo(int lb_code) {
		List<Schedule> sList=lDao.getLibraryCalendarInfo(lb_code);
		
		return sList;
	}

	public String setLibraySchedule(Schedule schedule) {
		boolean result=lDao.setLibraySchedule(schedule);
		if(result) {
			return "성공";
		}else {
			return "실패";
		}
		
		
	}

	public String scheduleDelete(Schedule schedule) {
		boolean result=lDao.scheduleDelete(schedule);
		if(result) {
			return "성공";
		}else {
			return "실패";
		}
	}
    

}
