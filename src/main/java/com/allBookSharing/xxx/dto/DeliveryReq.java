package com.allBookSharing.xxx.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("deliveryreq")
@Data
@Accessors(chain=true)
public class DeliveryReq {
	
	
	private String de_code;//책코드
	private int de_lcode;//도서관 코드
	private String de_id; //사용자아이디
	private int de_quantity; //권수
	
}
