package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("classification")
@Accessors(chain=true)
public class Classification {
	int bigNum;
	int smallNum;
	String category;
}
