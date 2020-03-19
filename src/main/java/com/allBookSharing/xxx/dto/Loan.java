package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("loan")
@Accessors(chain=true)
public class Loan {

		int bo_num;					//대출번호
		String lb_name;				//도서관이름
		String bk_name;				//책이름
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_date;				//대출일
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_return_date;		//반납예정일
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_real_return_date;	//실제반납일
		int bd_return_extension;	//연장여부
		int arrearsday;				//연체일수
		
}
