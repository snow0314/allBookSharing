package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("books")
@Data
@Accessors(chain=true)
public class Books {
	private String bk_code; //ISBN 코드
	private int bk_lcode; //도서관 코드
	private String bk_name; //책 이름
	private String bk_lname; //도서관 이름
	private String bk_introduction; //소개글
	private String bk_publicday; //출판일
	private String bk_publisher; //출판사
	private String bk_writer; //저자
	private String bk_image; //이미지
	private int bk_Quantity; //권수
	private int bk_bg_num; //대분류
	private int bk_sg_num; //소분류
	private int bk_booklend; //대출중인 책 권수

}
