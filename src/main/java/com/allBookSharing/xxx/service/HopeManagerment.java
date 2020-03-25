package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IHopeDao;
import com.allBookSharing.xxx.dto.Hope;
import com.google.gson.Gson;

@Service
public class HopeManagerment {

	@Autowired
	IHopeDao hDao;
	
	//사서 희망도서 목록
	public ModelAndView lbHopeList(Principal principal) {
		ModelAndView mav=new ModelAndView();
		String id=principal.getName();
		String view=null;
		List<Hope> hList=hDao.lbHopeList(id);
		
		if(hList!=null) 
			view="librarian/libraryHopeList";

		else
			view="librarian/librarymain";
		
		String json=new Gson().toJson(hList);
		
		mav.addObject("list",json);
		mav.setViewName(view);
		
		return mav;
	}

}
