package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("librarian")
@Accessors(chain=true)
public class Librarian {

	String la_id;	//사서 아이디
	String la_pw;	//사서 비번
	String lb_name;	//도서관이름
	int la_lcode;	//도서관코드
	String la_loc;	//지역
	
	
}
