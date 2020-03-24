package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dao.NoticeDao;
import com.allBookSharing.xxx.dto.Notice;
import com.google.gson.Gson;

@Service
public class NoticeManagement {
	
	@Autowired
	NoticeDao nDao;
	@Autowired
	IAdminManagementDao aDao;
	
	//공지사항 페이지
	public ModelAndView NoticeList() {
	
		ModelAndView mav= new ModelAndView();
		String view=null;
		
		List<Notice>nList=nDao.getNoticeList();
		
		if(nList!=null) {
			view="noticeList";
		}else
			view="noticeList";
		String json=new Gson().toJson(nList);
		mav.addObject("nList", json);
		mav.setViewName(view);
		
		return mav;
	}
    //공지사항 글 상세보기
	public ModelAndView noticeDetail(Notice ntc2) {
		ModelAndView mav=new ModelAndView();
		String view=null;
		Notice ntc=nDao.getNoticeDetail(ntc2);
		
		if(ntc!=null)
			view="noticeDetail";
		else
			view="redirect:/noticemove";
		
		mav.addObject("notice", ntc);
		
		mav.setViewName(view);
		
		return mav;
	}

}
