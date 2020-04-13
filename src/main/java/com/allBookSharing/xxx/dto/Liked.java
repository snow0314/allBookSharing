package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("liked")
@Data

@Accessors(chain=true)
public class Liked {
	
	private String lk_bcode;
	private String lk_id;
	private int lk_lcode;

}
