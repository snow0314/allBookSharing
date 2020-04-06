package com.allBookSharing.xxx.service;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IAdminManagementDao;
import com.allBookSharing.xxx.dao.NoticeDao;
import com.allBookSharing.xxx.dto.BigGroup;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Notice;
import com.allBookSharing.xxx.dto.Recommend;
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
    
	//공지사항 글 상세보기(관리자)
	public ModelAndView adNoticeDetail(Notice ntc2) {
		ModelAndView mav= new ModelAndView();
		String view=null;
		Notice ntc=nDao.getNoticeDetail(ntc2);
		if(ntc!=null)
			view="admin/adminNoticeDetail";
		else
			view="redirect:/noticemove";
		
		mav.addObject("notice", ntc);
		mav.setViewName(view);
		
		return mav;
	}

    //공지사항 글 삭제
	public ModelAndView deleteNotice(Notice ntc) {
		
		ModelAndView mav=new ModelAndView();
		String view=null;
		
		boolean result=nDao.deleteNotice(ntc);
		
		if(result)
		   view="redirect:/adminnotice";
		else
			view="redirect:/nodetail";
		
		mav.setViewName(view);
		
		return mav;
	}
	
	//추천도서 등록
	public ModelAndView recommendInsert(Recommend recommend) {
		int result = aDao.recommendInsert(recommend);
		mav = new ModelAndView();
		if(result != 0) {
			mav.addObject("msg", "추천도서 등록에 성공하셨습니다.");
		}else {
			mav.addObject("msg", "추천도서 등록에 실패하셨습니다.");
		}
		mav.setViewName("admin/recommendInsert");
		return mav;
	}
	
	//관리자 도서관 정보 수정
	public ModelAndView libraryDelete(Library lib) {
		mav=new ModelAndView();
		System.out.println("수정 서비스");
		boolean result=aDao.libraryDelete(lib);
		
		if(result) {
			mav.setViewName("admin/libraryDelete");
			mav.addObject("msg", "성공");
		}else {
			mav.setViewName("admin/libraryDelete");
			mav.addObject("msg", "실패");
		}
		
		return mav;
	}
	
	//관리자 도서관 삭제
	public String libraryDrop(String lb_code) {
		int result=0;
		
		result=aDao.libraryDrop(lb_code);
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	public Boolean recommendDelete(String re_bcode) {
		Boolean result=aDao.recommendDelete(re_bcode);
		
		return result;
	}

	public Boolean recommendModify(String re_bcode, String re_contents) {
		Boolean result=aDao.recommendModify(re_bcode,re_contents);
		return result;
	}

	

	
	//bar 차트 
	public Map<Integer, Integer> barChart() {
		Map<Integer, Integer> map=new HashMap<Integer, Integer>();
		
		for(int i=1;i<13;i++) {
			map.put(i, aDao.barChart(i));
		}
		return map;
	}

	
	//pie 차트
	public List<BigGroup> pieChart() {
		
		List<BigGroup> bList=aDao.pieChart();
		System.out.println("bList="+bList);
		
		
		return bList;
	}
	

}
