package com.allBookSharing.xxx;

import java.util.Random;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allBookSharing.xxx.dao.IjoinMangementDao;
import com.allBookSharing.xxx.service.MailService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class JoinMembership {
	private Gson gson= new GsonBuilder().setDateFormat("yyyy-mm-dd HH:mm:ss").create();
	
	
	private IjoinMangementDao userDAO;
	
	@Autowired
	private MailService MailService;
	
	@RequestMapping(value= "/checkMaill", produces="application/text; charset=utf8")
	@ResponseBody
	private String checkMail(@RequestParam String email) {
		User user = userDAO.findOneByEmail(email);
		return gson.toJson(user);
	}
	
	@RequestMapping(value = "/sendMail/",method = RequestMethod.POST, produces="application/json")
	@ResponseBody
	private boolean sendMail(HttpSession session, @RequestParam String email) {
		int randomCode = new Random().nextInt(10000) + 1000;
		String joinCode = String.valueOf(randomCode);
		session.setAttribute("joinCode", joinCode);
		
		String subject ="회원가입 승인 번호 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("회원가입 승인번호는").append(joinCode).append("입니다.");
		return MailService.send(subject,sb.toString(),"본인아이디@gmail.com",email);
				
	}
	

}
