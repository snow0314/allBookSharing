package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dao.NoticeDao;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Notice;
import com.google.gson.Gson;
@Service
public class AdminManagement {
	
	@Autowired
	IAdminManagementDao aDao;
	
	@Autowired
	NoticeDao nDao;

	ModelAndView mav;
	
	public ModelAndView libraryinsert(Library lib) {
		ModelAndView mav=new ModelAndView();
		boolean result=aDao.libraryinsert(lib);
		
		System.out.println("result="+result);
		
		if(result) {
		mav.addObject("msg", "성공");
		mav.setViewName("admin/libraryinsert");
		}
		else {
			mav.addObject("msg", "실패");
			mav.setViewName("admin/libraryinsert");
			
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

	//등록할 도서관 코드 가져오는 메소드
	public Integer getLibraryNextCode() {
		
		Integer code=aDao.getLibraryNextCode();
		
		return code;
	}

	public ModelAndView adminNotice() {
		
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		List<Notice> nList=nDao.getNoticeList();
		
		if(nList!=null)
			view="admin/adminNotice";
		else
			view="admin/adminindex";
		String json=new Gson().toJson(nList);
		mav.addObject("nList", json);
		mav.setViewName(view);
		
		
		return mav;
	}
     
	
	//공지사항 글쓰기 페이지 이동
	public ModelAndView movenoticeWrite() {
		
		ModelAndView mav= new ModelAndView();
		
		mav.setViewName("admin/noticeWrite");
		
		
		return mav;
	}
   //공지사항 글쓰기
	public ModelAndView noticeWrite(Notice ntc, Principal principal) {
		ModelAndView mav= new ModelAndView();
		String id=principal.getName();
		ntc.setNo_id(id);
		System.out.println("ntc="+ntc);
		String view=null;
		
		boolean result=nDao.noticeWrite(ntc);
		
		if(result)
			view="redirect:/adminnotice";
		else
			view="noticeWrite";
		
		mav.setViewName(view);
		
		return mav;
	}
    
	//공지사항 글 상세보기
	public ModelAndView noticeDetail(Notice ntc2) {
		ModelAndView mav= new ModelAndView();
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
