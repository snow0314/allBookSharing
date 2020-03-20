package com.allBookSharing.xxx.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Question {
	
	private int qs_num;
	private int qs_lcode;
	private String qs_id;
	private String qs_title;
	private String qs_content;
	private int qs_show;
	private String qs_state;
	private Date qs_dqte;

}
