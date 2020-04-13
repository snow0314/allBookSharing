package com.allBookSharing.xxx.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("likea")
@Accessors(chain = true)
public class LikedList2 {
   
   
   private int lb_code; //도서관 코드
   private String bk_code; //isbn코드
   private String id;
   
}