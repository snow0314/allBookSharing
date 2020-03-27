package com.allBookSharing.xxx;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IHopeDao;
import com.allBookSharing.xxx.dto.Hope;
import com.allBookSharing.xxx.dto.Library;

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
		
		
	//사서 희망도서 상호대차
		@Secured("ROLE_LIBRARIAN")
		@RequestMapping(value = "/swapbooks")
		public List<Library> swapBooks(String br_bcode) {
			System.out.println("br_bcode="+br_bcode);
			List<Library> lList=hDao.swapBooks(br_bcode);
			
			return lList;
		}


}
