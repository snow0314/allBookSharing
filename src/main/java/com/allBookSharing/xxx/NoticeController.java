package com.allBookSharing.xxx;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.Notice;
import com.allBookSharing.xxx.service.NoticeManagement;

@Controller
public class NoticeController {
   @Autowired
   NoticeManagement nm;
   
   ModelAndView mav;
   //공지사항 페이지 이동
   @GetMapping(value="/noticemove")
   public ModelAndView noticeList() {
	   ModelAndView mav= new ModelAndView();
	   
	   mav = nm.NoticeList();
	   return mav;
   }
   //공지사항 글 상세보기
   @PreAuthorize("isAuthenticated()")
   @GetMapping(value = "/nodetail")
   public ModelAndView noticeDetail(Notice ntc) {
	   
	   ModelAndView mav= new ModelAndView();
	   
	   mav = nm.noticeDetail(ntc);
	   return mav;
   }
   
	/*
	 * //공지사항 글 쓰기
	 * 
	 * @PreAuthorize("isAuthenticated()")
	 * 
	 * @PostMapping(value = "/noticewrite") public ModelAndView noticeWrite(Notice
	 * ntc,Principal principal) {
	 * 
	 * ModelAndView mav=new ModelAndView();
	 * 
	 * mav=nm.noticeWrite(ntc,principal);
	 * 
	 * return mav; }
	 */
   
}
