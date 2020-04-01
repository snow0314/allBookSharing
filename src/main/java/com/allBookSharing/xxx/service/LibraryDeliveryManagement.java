package com.allBookSharing.xxx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.ILibraryDeliveryDao;
import com.allBookSharing.xxx.dto.LibraryDelivery;
import com.google.gson.Gson;

@Service
public class LibraryDeliveryManagement {

	@Autowired
	ILibraryDeliveryDao ldDao;
	
	
	public ModelAndView deliveryManagementMove(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결(도서관 코드)
		int lb_code=Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
		
		
		List<LibraryDelivery> dList=ldDao.getDeliveryList(lb_code);
		
		String json=new Gson().toJson(dList);
		
		mav.addObject("list",json);
		view="librarian/deliveryList";
		mav.setViewName(view);
		
		
		return mav;
	}

}
