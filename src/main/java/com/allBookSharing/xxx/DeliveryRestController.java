package com.allBookSharing.xxx;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.service.DeliveryManagement;

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
}
