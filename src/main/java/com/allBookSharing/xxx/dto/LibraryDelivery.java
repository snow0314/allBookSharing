package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("librarydelivery")
@Accessors(chain=true)
public class LibraryDelivery {
	private int bo_num;
	private String bo_id;
	private int bd_num;
	private int bd_bo_num;
	private String bd_bcode;
	private String bk_name;
	private String bk_image;
	private String bk_writer;
	private int bd_lcode;
	private int bd_state_num;
	private int bd_count;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date bd_date;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date bd_return_date;
	private int bd_return_extension;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date bd_real_return_date;
	private String bd_reason;
	private int bd_on_off;
	
	
}
