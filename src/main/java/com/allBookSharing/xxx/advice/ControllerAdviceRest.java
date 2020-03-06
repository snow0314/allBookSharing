package com.allBookSharing.xxx.advice;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;







@RestControllerAdvice
public class ControllerAdviceRest {
	//한글 깨짐 방지
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/plain;charset=utf-8");
		return headers;
	}
	
	
	@ExceptionHandler(com.allBookSharing.xxx.Exception.IdCheckException.class)
	public ResponseEntity<?>idDupExceptionHandler(com.allBookSharing.xxx.Exception.IdCheckException ex) {
		
		return new ResponseEntity<String>(ex.getMessage(), getHeaders(),HttpStatus.EXPECTATION_FAILED);
	}
	
}
