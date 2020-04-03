package com.allBookSharing.xxx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.ILibraryDeliveryDao;
import com.allBookSharing.xxx.dto.LibraryDelivery;
import com.allBookSharing.xxx.dto.Reservation;
import com.google.gson.Gson;

@Service
public class LibraryDeliveryManagement {

	@Autowired
	ILibraryDeliveryDao ldDao;
	
	//사서 배송 목록
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

	//사서 배송 상세 보기
	public List<LibraryDelivery> lbDeliveryDetail(HttpServletRequest req, LibraryDelivery ld) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결(도서관 코드)
		ld.setBd_lcode(Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE"))));
		System.out.println("ld="+ld);
		
		List<LibraryDelivery> DeliveryDetail=ldDao.getLbDeliveryDetail(ld);		
		
		return DeliveryDetail;
	}


	//사서 배송 취소
	public boolean lbDeliveryCancel(LibraryDelivery ld) {
		
		boolean result=ldDao.lbDeliveryCancel(ld);
		
		return result;
	}
	
	
	
	//사서 배송 완료
	public ModelAndView lbDeliveryComplete(LibraryDelivery ld) {
		ModelAndView mav=new ModelAndView();
		
		boolean result=ldDao.lbDeliveryComplete(ld);
		if(result)
		mav.setViewName("redirect:/deliverymanagementmove");
		
		return mav;
		
	}

	//반납관리
	public ModelAndView lbReturnBooksManagementMove(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		String view=null;

		// 빅 데시멀 오류 발생 String.valueOf 사용하여 해결(도서관 코드)
		int lb_code=Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE")));
				
				
		List<LibraryDelivery> dList=ldDao.getReturnDeliveryList(lb_code);
				
		String json=new Gson().toJson(dList);
				
		mav.addObject("list",json);
		view="librarian/returnBookList";
		mav.setViewName(view);
		
		return mav;
	}

	//반납신청 상세
	public LibraryDelivery returnbooksdetail(HttpServletRequest req, LibraryDelivery ld) {
		
		//빅 데시멀 오류 발생 String.valueOf 사용하여 해결(도서관 코드)
		ld.setBd_lcode(Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE"))));
		
		LibraryDelivery returnbook=ldDao.getReturnbooksdetail(ld);
		
		return returnbook;
	}

	
	//반납 완료 
	public ModelAndView returnBookComplete(HttpServletRequest req, LibraryDelivery ld) {
		ModelAndView mav=new ModelAndView();
		
		//빅 데시멀 오류 발생 String.valueOf 사용하여 해결(도서관 코드)
		ld.setBd_lcode(Integer.parseInt(String.valueOf(req.getSession().getAttribute("LB_CODE"))));
		boolean result1=false;
		boolean result2=false;
		List<Reservation> list=ldDao.getReservationCheck(ld);
		if(list!=null) {
			 result1=ldDao.updateReturnBookComplete(ld);
			 result2=ldDao.updateReturnBooksNotNull(ld);
			
		}
		else {
			result1=ldDao.updateReturnBookComplete(ld);
			result2=ldDao.updateReturnBooksNull(ld);
		}
		
		
		if(result1&&result2) {
			mav.setViewName("redirect:/returnbooksmanagementmove");
		}
		
		
		
		return mav;
	}

	
	
	
	
	
	
}
