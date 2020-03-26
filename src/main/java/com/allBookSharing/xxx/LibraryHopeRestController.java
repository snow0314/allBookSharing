package com.allBookSharing.xxx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IHopeDao;
import com.allBookSharing.xxx.dto.Hope;

@RestController
public class LibraryHopeRestController {
	@Autowired
	IHopeDao hDao;
	
	//사서 희망도서 상세보기
		@Secured("ROLE_LIBRARIAN")
		@RequestMapping(value = "/lbhopedetail")
		public Hope lbHopeDetail(int br_num) {
			
			Hope hope=hDao.lbHopeDetail(br_num);
			
			return hope;
		}
}
