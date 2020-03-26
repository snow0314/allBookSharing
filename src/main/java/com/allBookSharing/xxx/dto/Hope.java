package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("hope")
@Accessors(chain=true)
public class Hope {
	private int br_num;			//요청번호
	private int br_lcode;		//도서관코드
	private String lb_name;		//도서명
	private String lb_loc;		//소속지역
	private String br_id;		//신청한 사람 아이디
	private String br_bcode;		//ISBN코드
	private String br_titile;	//신청제목
	private String br_reason;	//신청사유
	private int br_sms;			//SMS수신여부 0: no, 1:yes
	private Date br_date;		//신청일
	private int br_situation;	//요청상태
	private String br_false;	//반려사유
}
