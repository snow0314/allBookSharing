package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("deliveryreq")
@Data
@Accessors(chain=true)
public class DeliveryReq {
	
	
	private String de_code;//책코드
	private int de_lcode;//도서관 코드
	private String lb_name;//도서관 이름
	private String de_id; //사용자아이디
	private String grade; //사용자 등급
	private int de_quantity; //권수
	private String bk_name; //책 제목
	private String bk_introduction; //소개글
	private String bk_publicday; //출판일
	private String bk_publisher; //출판사
	private String bk_writer; //저자
	private String bk_image; //이미지
	private int bk_bg_num; //대분류 번호
	private String bg_cate; //대분류 이름
	private int bk_sg_num; //소분류 번호
	private String sg_cate; //소분류 이름
}
