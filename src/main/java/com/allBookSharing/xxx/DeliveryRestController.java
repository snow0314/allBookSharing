package com.allBookSharing.xxx;

import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Seats;
import com.allBookSharing.xxx.service.DeliveryManagement;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class DeliveryRestController {

	@Autowired
	DeliveryManagement dm;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/getdeliverylist", produces = "application/json;charset=UTF-8")
	public List<DeliveryReq> getDeliveryList(Principal principal) { //도서관 수정 페이지에 정보 채워주는 메소드
		List<DeliveryReq> dList = dm.getDeliveryList(principal.getName());
		

		return dList;
	}
	
	//배송 신청버튼 클릭시 대출목록에 들어가는 메소드
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/borrowlistinsert", produces = "application/json;charset=UTF-8")
	public String borrowListInsert(Principal principal, String json, String pl_inout) throws JsonParseException, JsonMappingException, IOException { 
		// 제이슨 형태의 문자열을 객체로 변환
		ObjectMapper mapper = new ObjectMapper();
		List<DeliveryReq> dList = Arrays.asList(mapper.readValue(json, DeliveryReq[].class));
		
		
		
		return dm.borrowListInsert(dList,principal.getName(), pl_inout);
	}
	
	//배송 신청버튼 클릭시 대출목록에 들어가는 메소드
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/usergradecheck", produces = "application/json;charset=UTF-8")
	public String userGradeCheck(Principal principal){ 
			
		
		return dm.userGradeCheck(principal.getName());
	}	
}
