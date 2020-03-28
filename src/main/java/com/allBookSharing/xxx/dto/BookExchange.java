package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("exchange")
@Accessors(chain=true)
public class BookExchange {

		private int be_num;				//상호대차번호
		private String be_bcode;		//isbn코드
		private String lb_name;			//도서관 이름
		private int be_lcode;			//신청한 도서관코드
		private int be_res_lcode;		//신청받은 도서관코드
		private int be_count;			//신청권수
		private int be_situation;		//상태
		private Date be_date;			//상호대차 신청일
}
