package com.allBookSharing.xxx.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dao.ILibrarianManagementDao;
import com.allBookSharing.xxx.dto.Librarian;
import com.allBookSharing.xxx.dto.Library;

@Service
public class LibrarianManagement {
	
	@Autowired
	ILibrarianManagementDao lDao;

	@Autowired
	IAdminManagementDao aDao;
	
	ModelAndView mav;


	public ModelAndView librarianinsert(Librarian lia) {
		ModelAndView mav=new ModelAndView();
		
		BCryptPasswordEncoder pwdEncoder =new BCryptPasswordEncoder();
		lia.setLa_pw(pwdEncoder.encode(lia.getLa_pw()));
		boolean result=lDao.librarianinsert(lia);
		System.out.println("result="+result);
		
		if(result) {
		mav.setViewName("admin/adminindex");
		}
		else {
			mav.setViewName("admin/librarianinsert");
			
		}
		
		return mav;
	}


	public List<Library> getlibraryinfo() {
		List<Library> lib= aDao.getlibraryinfo();
		return lib;
	}


	public String LibrarianDelete(String la_id) {
		int result=0;
		
		result=aDao.LibrarianDelete(la_id);
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}


	public List<Library> getinfo() {
		List<Library> lib= aDao.getinfo();
		return lib;
	}
		
	}
	
