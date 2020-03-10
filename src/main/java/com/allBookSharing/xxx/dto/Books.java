package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("books")
@Data

@Accessors(chain=true)
public class Books {
	private String bk_code;
	private int bk_lcode;
	private String bk_name;
	private String bk_lname;
	private String bk_introduction;
	private String bk_publicday;
	private String bk_publisher;
	private String bk_writer;
	private String bk_image;
	private int bk_Quantity;
	private int bk_bg_num;
	private String bk_bg_cate;
	private int bk_sg_num;
	private String bk_sg_cate;
	private int bk_booklend;

}
