package com.allBookSharing.xxx;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.service.LibrayManagement;


@RestController
public class LibrayRestController {
	
	@Autowired
	LibrayManagement lm;
	
	@Secured("ROLE_LIBRARIAN")
	@RequestMapping(value = "/libraryinfo", produces = "application/json;charset=UTF-8")
	public Library getLibraryInfo(HttpServletRequest req) {

		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결
		int lb_code = Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
		
		Library library=lm.getLibraryInfo(lb_code);

		return library;
	}
}
