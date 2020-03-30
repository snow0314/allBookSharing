package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("reservation")
@Data
@Accessors(chain=true)
public class Reservation {
	private String rv_num; //예약번호
	private String rv_code; //ISBN코드
	private String bk_name; //도서명
	private String lb_name; //도서관이름
	private int rv_lcode; //도서관코드
	private String rv_id; //사용자아이디
	private String rv_date; //예약날자
	private String bk_state; //상태 0:대출불가, 1:대출가능, 2: 예약중
    private int rv_count;//예약자 수 
	

}
