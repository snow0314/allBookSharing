package com.allBookSharing.xxx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dto.Library;
@Service
public class AdminManagement {
	
	@Autowired
	IAdminManagementDao aDao;

	
	ModelAndView mav;
	
	public ModelAndView libraryinsert(Library lib) {
		ModelAndView mav=new ModelAndView();
		boolean result=aDao.libraryinsert(lib);
		
		System.out.println("result="+result);
		
		if(result) {
		mav.setViewName("admin/adminindex");
		}
		else {
			mav.setViewName("admin/admininsert");
			
		}
		
		return mav;
	}

}
