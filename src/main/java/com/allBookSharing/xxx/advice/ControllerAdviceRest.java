package com.allBookSharing.xxx.advice;

import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.RestControllerAdvice;







@RestControllerAdvice
public class ControllerAdviceRest {
	//한글 깨짐 방지
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/plain;charset=utf-8");
		return headers;
	}
	

	
}
