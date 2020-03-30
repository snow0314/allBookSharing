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
		
		System.out.println("eList="+eList);
		
		view="librarian/mutualLoan";
		//null이면 자료가 없으니까 에러는 아님
		
		String json=new Gson().toJson(eList);
		
		mav.addObject("list",json);
		
		mav.setViewName(view);
		
		return mav;
	}

	public ModelAndView mutulLoanAccept(BookExchange bookEx) {
		ModelAndView mav=new ModelAndView();
		String view=null;

		
		//상호대차 수락하면 해당 도서의 보유권수를 차감
		boolean result1=mlDao.updateMutulLoanQty(bookEx);
		//상호대차 신청 상태를 1(수락)으로 update
		boolean result2=mlDao.updateMutulLoanState(bookEx);
		//희망도서 테이블 상태값을 4(상호대차수락)으로 update
		boolean result3=mlDao.updateHopeState(bookEx);
		if(result1&&result2&&result3)
			view="redirect:/mutualloanmove";
		
		mav.setViewName(view);
		
		
		return mav;
	}

	
	
	public ModelAndView mutulLoanFalse(BookExchange bookEx) {
		ModelAndView mav=new ModelAndView();
		String view=null;

		//상호대차 거절(상태 업데이트)
		boolean result1=mlDao.updateMutulLoanFalse(bookEx);
		boolean result2=mlDao.updateHopeStateFalse(bookEx);
		
		if(result1&&result2)
		view="redirect:/mutualloanmove";
		
		mav.setViewName(view);
		
		return mav;
	}

}
