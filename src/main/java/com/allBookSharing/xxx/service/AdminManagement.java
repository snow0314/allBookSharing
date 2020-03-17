package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dto.Library;
import com.google.gson.Gson;
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

	public ModelAndView getLibraryList() {
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		List<Library> lList=aDao.getLibraryList();
		System.out.println("lList = "+lList);
		
		String json=new Gson().toJson(lList);
		if(lList!=null) {
			view="admin/librarylist";
		}
		else {
			view="adminindex";
			
		}
		mav.addObject("json",json);
		mav.setViewName(view);
		return mav;
	}

}
