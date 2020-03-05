package com.allBookSharing.xxx;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class librayBookController {
	
	
	//@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/libraybookinsertmove")
	public String bookInsertMove() {
		
		return "librarian/bookinsert";
	}
	
}
