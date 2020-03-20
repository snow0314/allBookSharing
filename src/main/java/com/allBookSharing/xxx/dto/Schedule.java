package com.allBookSharing.xxx.dto;


import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Alias("schedule")
@Data
@NoArgsConstructor
@Accessors(chain=true)
public class Schedule {
	private int sd_lcode;
	private String start;
	private String end;
	private String title;
}
