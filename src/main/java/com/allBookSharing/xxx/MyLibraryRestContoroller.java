package com.allBookSharing.xxx;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Review;
import com.allBookSharing.xxx.service.MyLibraryManagement;

@RestController
public class MyLibraryRestContoroller {
	@Autowired
	MyLibraryManagement ml;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/getreview", method = RequestMethod.GET)
	public Review getReview(Principal principal, String rv_bcode) {
		Review review = ml.getReview(rv_bcode, principal.getName());
		
		return review;
	}
}
