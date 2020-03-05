package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;



@Data
@Alias("member")
@Accessors(chain=true)
public class Member {

	String mb_id;			//아이디
	String mb_pw;			//비밀번호
	String mb_area;			//지역
	String mb_name;			//이름
	String enabled;			//계정사용여부
	String us_id;			//아이디
	String us_address;		//주소
	int us_phone;			//휴대폰
	String  us_email;		//이메일
	int us_point;			//포인트
	String us_image;		//이미지
	
	
	
}
