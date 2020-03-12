package com.allBookSharing.xxx.mail.HtmlEmail;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	
	public static void sendMail(String email, String subject,
			String msg) throws Exception{
		//Mail Server 설정
		
		String charSet = "utf-8";
		String hostSMTP= "smtp.naver.com"; //smtp 서버명
		String hostSMTPid="bear21678";
		String hostSMTPpwd="wlsdn2167418";
		
		//보내는 사람
		String fromEmail = "bear21678@naver.com";
		String fromName = "조진우";
		
		//email전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			mail.setAuthentication(hostSMTPid,hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
