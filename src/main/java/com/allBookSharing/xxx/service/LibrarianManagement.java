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
		boolean result2=lDao.librarianinsert2(lia);
		boolean result3=lDao.librarianinsert3(lia);
		
		System.out.println("result="+result);
		System.out.println("result2="+result2);
		System.out.println("result3="+result3);
		
		if(result&&result2&&result3) {
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

}
