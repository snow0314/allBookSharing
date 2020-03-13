package com.allBookSharing.xxx.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IjoinMangementDao;
import com.allBookSharing.xxx.dto.Member;




@Service
public class JoinManagement {

	@Autowired
	IjoinMangementDao jdao;
	
	
	ModelAndView mav;
	
	

	public ModelAndView memberJoin(MultipartHttpServletRequest multi) {
		mav=new ModelAndView();
	      String view=null;
	      
	      System.out.println("멤버쪼인 서비스");
	      System.out.println("이미지 : "+multi.getFile("us_image"));
	      System.out.println("아이디 : "+multi.getParameter("mb_id"));
	      System.out.println("비  번 : "+multi.getParameter("mb_pw"));
	      System.out.println("주  소 : "+multi.getParameter("us_address"));
	     
	      //인코더 암호화  --디코더 복호화
	      //스프링시큐리티는 암호화는 가능하지만 복호화는 불가능하다.
	      BCryptPasswordEncoder pwdEncoder =new BCryptPasswordEncoder();
	      //비번만 암호화해서 DB에 저장
	      
	      System.out.println("fileUp");
			// 1.이클립스의 물리적 저장경로 찾기
			String root = multi.getSession().getServletContext().getRealPath("/");
			System.out.println("root=" + root);
			String path = root + "profile/";
			System.out.println("path="+path);
			// 2.폴더 생성을 꼭 할것...
			File dir = new File(path);
			if (!dir.isDirectory()) { // upload폴더 없다면
				dir.mkdir(); // upload폴더 생성
			}
			// 파일 메모리에 저장
			MultipartFile mf=multi.getFile("us_image");
			String oriFileName = mf.getOriginalFilename(); // a.txt
			String sysFileName = System.currentTimeMillis() + "."
					+ oriFileName.substring(oriFileName.lastIndexOf(".") + 1);
			
			
			Member mb=new Member();
					mb.setMb_id(multi.getParameter("mb_id")).setMb_pw(pwdEncoder.encode(multi.getParameter("mb_pw"))).setMb_area(multi.getParameter("mb_area")).setMb_name(multi.getParameter("mb_name"))
	    		      .setUs_id(multi.getParameter("us_id")).setUs_address(multi.getParameter("us_address")).setUs_phone(multi.getParameter("us_phone")).setUs_email(multi.getParameter("us_email"))
	    		      .setUs_image(sysFileName);
			
				
			System.out.println("mb="+mb);
			// 5.메모리->실제 파일 업로드
			try {
				mf.transferTo(new File(path + sysFileName));	// 서버  profile에 파일 저장
				boolean result=jdao.memberJoin(mb);
				if(result) 
					view="index";
				else
					view="joinfrm";
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 	
			
		
			
			
			
	      mav.setViewName(view);
	      return mav;
	   }
	
	

	public String getIdFind(String email) {
		String idSerch=jdao.getIdFind(email);
		System.out.println("id="+idSerch);
		return idSerch;
	}

	public String idCheck(String mb_id) {
		String msg;
		int result=jdao.idCheck(mb_id);
		System.out.println("result="+result);
		
		if(result==1) {
			msg="사용불가능한 아이디입니다";
		}
		else
		{
			msg="사용가능한 아이디입니다.";
		}
		
		
		return msg;
	}
	  

}
