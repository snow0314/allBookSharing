package com.allBookSharing.xxx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dao.IMutualLoanDao;
import com.allBookSharing.xxx.dto.BookExchange;
import com.allBookSharing.xxx.dto.Hope;

@RestController
public class MutualLoanRestController {

	@Autowired
	IMutualLoanDao mlDao;
	
	
	//상호대차 상세보기
			@Secured("ROLE_LIBRARIAN")
			@RequestMapping(value = "/mutaulloandetail")
			public BookExchange mutaulLoanDetail(int be_num) {
				
				BookExchange exchange=mlDao.mutaulLoanDetail(be_num);
				
				return exchange;
			}
	
	
	
}

