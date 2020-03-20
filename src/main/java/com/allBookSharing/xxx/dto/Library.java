package com.allBookSharing.xxx.dto;


import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.experimental.Accessors;



@Data
@Alias("library")
@Accessors(chain=true)
public class Library {
	
	int lb_code;			//도서관 코드
	String lb_name;			//도서관 이름
	String lb_loc;			//소속지역
	String lb_postcode;     //우편번호
	String lb_roadaddr;     //도로명 주소
	String lb_detailaddr;     //상세 주소
	String lb_extraaddr;     //주소 참고사항
	String lb_branchaddr;     //지번주소
	String lb_phone;		//전화번호
	String lb_email;		//이메일
	String lb_latitude;		//위도
	String lb_longitude;		//경도
	String la_id;
	int lb_quantity;
	String la_name;

}
