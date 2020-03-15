package com.allBookSharing.xxx.mail;


public class MailSender {

//	@Resource(name="mailSender")
//	private JavaMailSender mailSender;
	
	//public boolean mailSend(HttpServletRequest request) {
		
		
		
		//인증번호 생성
//		Random r = new Random();
//        int dice = r.nextInt(157211)+48271;
//        request.getSession().setAttribute("dice", dice); //세션에 인증번호 저장
		
//        String id= request.getParameter("mb_id");
//		String setfrom = "allBookSharing";
//		String tomail = request.getParameter("us_email"); // 받는 사람 이메일
//		String title = "온책나누리 비밀번호 찾기 인증 이메일입니다."; // 제목
//		String content ="안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다 "+
//                "비밀번호 찾기 인증번호는 " +dice+ " 입니다. "+
//                "받으신 인증번호를 홈페이지에 입력해 주시면 비밀번호 변경이 가능합니다."; 
//		
//		System.out.println("id="+id);
//		System.out.println("email="+tomail);
//		System.out.println("dice+"+dice);
        
//		try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
//					true, "UTF-8");
//
//			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
//			messageHelper.setTo(tomail); // 받는사람 이메일
//			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//			//messageHelper.setText(content); // 메일 내용
//
//			mailSender.send(message);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return true;
//	}

}
