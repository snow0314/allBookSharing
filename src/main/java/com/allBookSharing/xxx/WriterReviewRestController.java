package com.allBookSharing.xxx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dao.IMyLibraryDao;

@RestController
public class WriterReviewRestController {
	@Autowired
	IMyLibraryDao mdao;
	
    @RequestMapping(value = "/writereview")
    public boolean writeReview(int bo_num) {
       
    	boolean result=mdao.writeReview(bo_num);
       
       return result;
    }
	
}
