package com.allBookSharing.xxx.dto;

import java.util.Date;

import lombok.Data;
import lombok.experimental.Accessors;


@Data
@Accessors(chain=true)
public class Notice {

	private int no_num; //글번호
	private String no_id; //관리자 아이디
	private String no_title; //글제목
	private String no_content; //글내용
	private Date no_date; //작성날짜
	
}
