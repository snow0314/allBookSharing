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


		int bo_num;
		String bk_name;
		String bk_image;
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
}
