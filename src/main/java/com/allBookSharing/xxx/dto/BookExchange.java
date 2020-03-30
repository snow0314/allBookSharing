package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;
@ToString
@Data
@Alias("exchange")
@Accessors(chain=true)
public class BookExchange {

		private int be_num;				//상호대차번호
		private int be_rnum;			//희망도서요청번호
		private String be_bcode;		//isbn코드
		private String lb_name;			//도서관 이름
		private String bk_name;			//도서명
		private String bk_writer;		//저자
		private int be_lcode;			//신청한 도서관코드
		private int be_res_lcode;		//신청받은 도서관코드
		private int be_count;			//신청권수
		private int bk_quantity;		//보유권수
		private int be_situation;		//상호대차 상태
		private int br_situation;		//희망도서 상태
		private String bk_image;		//책 사진
		@JsonFormat(pattern = "yyyy-MM-dd")
		private Date be_date;			//상호대차 신청일
}
