package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("biggroup")
@Data
@Accessors(chain=true)
public class BigGroup {

		String bg_cate;
		int cnt;
}
