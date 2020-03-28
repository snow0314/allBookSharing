package com.allBookSharing.xxx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IMutualLoanDao;
import com.allBookSharing.xxx.dto.BookExchange;
import com.google.gson.Gson;

@Service
public class MutualLoanManagerment {

	@Autowired 
	IMutualLoanDao mlDao;
	
	public ModelAndView mutualLoanmove(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결(도서관 코드)
		int lb_code=Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
				
		List<BookExchange> eList=mlDao.getMutualLoan(lb_code);
		
		view="librarian/mutualLoan";
		//null이면 자료가 없으니까 에러는 아님
		
		String json=new Gson().toJson(eList);
		
		mav.addObject("list",json);
		
		mav.setViewName(view);
		
		return mav;
	}

}
