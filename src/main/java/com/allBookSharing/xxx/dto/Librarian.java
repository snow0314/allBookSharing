package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("librarian")
@Accessors(chain=true)
public class Librarian {

	String la_id;
	int la_lcode;
	String la_pw;
	String la_loc;
	String la_name;
	
	
}
