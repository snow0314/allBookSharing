package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("answer")
@Accessors(chain=true)
public class Answer {
	private int aw_num;
	private int aw_q_num;
	private String aw_id;
	private String aw_contents;
	private Date aw_date;
}
