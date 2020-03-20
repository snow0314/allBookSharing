package com.allBookSharing.xxx.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
public class Question {
	
	private int qs_num;//글번호
	private int qs_lcode;//도서관코드
	private String qs_id; //글쓴이
	private String qs_title;		//제목
	private String qs_content; //글내용
	private int qs_show; //공개여부
	private String qs_state; //상태
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date qs_date; //날짜

}
