package com.allBookSharing.xxx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.service.JoinManagement;

@RestController
public class JoinRestController {
	
	@Autowired
	private JoinManagement jmn;
   
	@GetMapping(value = "/idcheck", produces = "application/json;charset=utf-8")
	public ResponseEntity<?> AjaxView(String id){
	System.out.println("id="+id);
	
	System.out.println("1");
	return ResponseEntity.ok(jmn.idfind(id));
		
}
	
}
