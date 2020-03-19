package com.allBookSharing.xxx;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Schedule;
import com.allBookSharing.xxx.service.LibrayManagement;


@RestController
public class LibrayRestController {
	
	@Autowired
	LibrayManagement lm;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraryinfo", produces = "application/json;charset=UTF-8")
	public Library getLibraryInfo(HttpServletRequest req) { //도서관 수정 페이지에 정보 채워주는 메소드

		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결
		int lb_code = Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
		
		Library library=lm.getLibraryInfo(lb_code);

		return library;
	}
	
	@Secured("ROLE_LIBRARIAN") 
	@RequestMapping(value = "/libraycalendarinfo", produces = "application/json;charset=UTF-8")
	public List<Schedule> getLibraryCalendarInfo(HttpServletRequest req) { //도서관 일정 가져오는 메소드

		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결
		int lb_code = Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
		
		List<Schedule> sList =lm.getLibraryCalendarInfo(lb_code);

		return sList;
	}
	
	@Secured("ROLE_LIBRARIAN") 
	@RequestMapping(value = "/setlibrayschedule", produces = "application/json;charset=UTF-8")
	public String setLibraySchedule(HttpServletRequest req,Schedule schedule ) { //도서관 일정 가져오는 메소드

		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결
		int lb_code = Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
		schedule.setSd_lcode(lb_code);
		System.out.println("스케쥴:"+schedule.toString());
		String result =lm.setLibraySchedule(schedule);

		return result;
	}
}
