package com.allBookSharing.xxx;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	// mailSending 코드
	@RequestMapping(value = "mailSending" ,produces = "application/json;charset=UTF-8")
	public String mailSending(HttpServletRequest request) {
		// 1.아이디와 메일 DB에서 확인
		// 2.일치하면 인증 번호 생성 및 세션에 저장 후 이메일 전송
		// 3.view 페이지에서 인증번호 입력
		// 4.일치하면 비밀번호 변경 가능
		
		
		System.out.println("메일1");

			String setfrom = "onbook";
			String tomail = request.getParameter("us_email"); // 받는 사람 이메일
			String title = "제목"; // 제목
			String content = "내용"; // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}

			return "성공";
		
}
}
