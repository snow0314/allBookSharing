package com.allBookSharing.xxx;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.ReadingRoom;
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
	
	/*
	 * @RequestMapping(value = "/libraryreadingroominsert", produces =
	 * "application/json;charset=UTF-8") public String readingRoomInsert(String
	 * json, HttpServletRequest req) throws JsonParseException,
	 * JsonMappingException, IOException {
	 * 
	 * // 제이슨 형태의 문자열을 객체로 변환 ObjectMapper mapper = new ObjectMapper(); ReadingRoom
	 * readingRoom = mapper.readValue(json, ReadingRoom.class);
	 * 
	 * // 빅 데시멀 오류 발생 String.valueOf 사용하여 해결 int lb_code =
	 * Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
	 * 
	 * readingRoom.setRm_lcode(lb_code);
	 * 
	 * return rm.readingRoomInsert(readingRoom); }
	 */
}
