package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("librarydelivery")
@Accessors(chain=true)
public class LibraryDelivery {
	private int bo_num;
	private String bo_id;
	private int bd_bo_num;
	private String bd_bcode;
	private String bk_name;
	private int bd_lcode;
	private int bd_state_num;
	private int bd_count;
	private Date bd_date;
	private Date bd_return_date;
	private int bd_return_extension;
	private Date bd_real_return_date;
	private String bd_reason;
	private int bd_on_off;
	
	
}
