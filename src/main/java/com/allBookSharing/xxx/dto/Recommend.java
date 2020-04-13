package com.allBookSharing.xxx.dto;


import org.apache.ibatis.type.Alias;


import lombok.experimental.Accessors;


import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.experimental.Accessors;

@Alias("recommend")
@Data
@Accessors(chain=true)

public class Recommend {
	private String re_bcode; //ISBN 코드
	private String re_bname; //책 제목

	private String re_bwriter; //저자
	private String re_publisher; //출판사
	private String re_publicday; //출판일
	private String re_introduction; //소개글

	private int re_sg_num; //소분류
	private String sg_cate;//소분류 이름
	private int re_bg_num; //대분류
	private String bg_cate;//소분류 이름
	private String re_contents; //추천글
	private String re_date; //추천날짜
	private String re_image;
	 
}
