package com.allBookSharing.xxx.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.Exception.IdCheckException;
import com.allBookSharing.xxx.dao.IjoinMangementDao;
import com.allBookSharing.xxx.dto.Member;




@Service
public class JoinManagement {

	@Autowired
	IjoinMangementDao jdao;
	
	ModelAndView mav;
	
	public String idfind(String id) {
		System.out.println("여기 id="+id);
		Member mb = jdao.idfind(id);
    
    if(mb!=null) {
        throw new IdCheckException("사용불가 아이디입니다.");
    }
    
        return "사용가능한 아이디입니다.";
	}

	public ModelAndView memberJoin(Member mb) {
		mav=new ModelAndView();
	      String view=null;
	      
	      //인코더 암호화  --디코더 복호화
	      //스프링시큐리티는 암호화는 가능하지만 복호화는 불가능하다.
	      BCryptPasswordEncoder pwdEncoder =new BCryptPasswordEncoder();
	      //비번만 암호화해서 DB에 저장
	      mb.setMb_pw(pwdEncoder.encode(mb.getMb_pw()));
	      
	      if(jdao.memberJoin(mb)) {
	         System.out.println("true");
	         view="home"; //회원가입 성공시
	         mav.addObject("check",1);  //회원가입 성공
	      }
	      else {
	         view="joinfrm"; //회원가입실패시   
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
