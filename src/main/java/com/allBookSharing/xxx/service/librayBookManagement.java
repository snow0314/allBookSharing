package com.allBookSharing.xxx.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IlibrayBookManagementDao;
import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Classification;

@Service
public class librayBookManagement {

	@Autowired
	IlibrayBookManagementDao lDao;
	
	ModelAndView mav;

	public List<Classification> getBigGroup() {
		
		List<Classification> bList=lDao.getBigGroup();
		
		return bList;
	}

	public List<Classification> getSmallGroup(Integer bigNum) {
		
	
		
		List<Classification> sList=lDao.getSmallGroup(bigNum);
		
		return sList;
	}

	public ModelAndView bookInsert(Books book) {
		
		boolean result=lDao.bookInsert(book);
		mav=new ModelAndView();
		
		if(result) {
			mav.addObject("bookInsertMsg", "true");
			mav.setViewName("redirect:libraybookinsertmove");
		}else {
			mav.addObject("bookInsertMsg", "false");
			mav.setViewName("redirect:libraybookinsertmove");
		}
		
		
		return mav;
	}

}
