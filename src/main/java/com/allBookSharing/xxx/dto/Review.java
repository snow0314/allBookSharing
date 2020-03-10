package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("review")
@Data

@Accessors(chain=true)
public class Review {
	private String rv_bcode;
	private String rv_id;
	private String rv_contents;
	private int rv_grade;
	
}
