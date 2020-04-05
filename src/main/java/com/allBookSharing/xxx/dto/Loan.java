package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("loan")
@Accessors(chain=true)
public class Loan {


		int bd_num;
		int bo_num;
		String bk_name;
		String bk_image;
		int lb_code;
		String lb_name;
		String lb_loc;
		int bd_on_off;
		String bk_writer;
		String bk_code;//isbn코드
		int bd_state_num;//대출상태
		int bd_count;//대출권수
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_date;				//대출일
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_return_date;		//반납예정일
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_real_return_date;	//실제반납일
		int bd_return_extension;	//연체여부?
		int arrearsday;		//누적 연체 일수
		String bk_publisher;
		String bk_publicday;
		int br_num; //희망도서 요청번호
		String br_titile; //희망도서 신청 제목
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date br_date;				//신청일
		int br_situation; //요청 상태 0.답변대기 1.처리중 2.반려 3.소장중
		String br_false; //반려 이유
		String br_id; //희망도서 글쓴이
		String br_loc; //도서관 지역
		String bd_reason; //취소사유
		String br_bname;
		String br_name;
		String br_bcode;
		String br_writer;
		int br_lcode;
		int br_sms;
		String br_image;
		String rv_contents; //리뷰 내용
		
	/*
	 * int br_sms; //sms수신여부
	 */}
