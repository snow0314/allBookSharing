package com.allBookSharing.xxx;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeliveryController {

	//배송 서비스 안내 페이지 이동
	    @PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/deliveryinformation")
		public String deliveryInformationMove() {
			
			return "deliveryInformation";
		}
	
}
