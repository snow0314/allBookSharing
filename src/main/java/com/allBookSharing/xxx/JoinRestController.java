package com.allBookSharing.xxx;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.service.JoinManagement;

@RestController
public class JoinRestController {

	@Autowired
	private JoinManagement jmn;

	@GetMapping(value = "/idcheck", produces = "application/json;charset=utf-8")
	public ResponseEntity<?> AjaxView(String id) {
		System.out.println("id=" + id);

		System.out.println("1");
		return ResponseEntity.ok(jmn.idfind(id));

	}

	@GetMapping(value = "/idfind", produces = "application/json;charset=utf-8")
	public String getIdFind(String email) {
		System.out.println("email:" + email);
		String idfind = jmn.getIdFind(email);
		System.out.println("컨트롤러" + idfind);
		return idfind;

	}

}
