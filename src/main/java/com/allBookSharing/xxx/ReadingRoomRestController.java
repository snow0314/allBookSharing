package com.allBookSharing.xxx;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.ReadingRoom;
import com.allBookSharing.xxx.dto.Seats;
import com.allBookSharing.xxx.service.UserReadingRoomManagement;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class ReadingRoomRestController {
	
	@Autowired
	UserReadingRoomManagement rm;
	
	// 메인페이지에서 열람실 예약 페이지로 이동하는 메소드
	@RequestMapping(value = "/getzoneinfo", produces = "application/json;charset=UTF-8")
	public List<Library> getZoneInfo() {
		List<Library> list=rm.getZoneInfo();
		
		return list;
	}
	
	//도서관 클릭시 해당 도서관에 속하는 열람실 목록 가져오는 메소드
	@RequestMapping(value = "/getreadingroominfo", produces = "application/json;charset=UTF-8")
	public List<ReadingRoom> getReadingRoomInfo(String lb_code) {
		System.out.println("열람실 목록1"+lb_code);
		List<ReadingRoom> list=rm.getReadingRoomInfo(lb_code);
		
		return list;
	}
	
	//열람실의 사용중인 좌석수 구하는 메소드
		@RequestMapping(value = "/numberofseatsinuse", produces = "application/json;charset=UTF-8")
		public Map<String, Integer> numberOfSeatsInUse(String rm_code) {
			
			return rm.numberOfSeatsInUse(rm_code);
		}
		
		@RequestMapping(value = "/readingroomreservation", produces = "application/json;charset=UTF-8")
		public String readingRoomReservation(Principal principal, String json) throws JsonParseException, JsonMappingException, IOException {
			// 제이슨 형태의 문자열을 객체로 변환
			ObjectMapper mapper = new ObjectMapper();
			Seats seats = mapper.readValue(json, Seats.class);
			
			seats.setSe_id(principal.getName());
			System.out.println(seats);
			
			return rm.readingRoomReservation(seats);
		}
		
	
}
