package com.allBookSharing.xxx.dto;

import java.text.SimpleDateFormat;
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
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_date;
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_return_date;
		@JsonFormat(pattern = "yyyy-MM-dd")
		Date bd_real_return_date;
		int arrearsday;
		
}
