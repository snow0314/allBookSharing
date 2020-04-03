package com.allBookSharing.xxx.dto;



import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;


@Data
@Alias("likedlist")
@Accessors(chain=true)
public class LikedList {
   private String id;
   private String bg_cate; //대분류
   private String sg_cate; //소분류
   private String bk_name; //책 제목
   private String bk_writer; //저자
   private String lb_name; //도서관 이름
   private int bk_Quantity; //소유권수
   private int bk_booklend; //대출권수
   private int lb_code; //도서관 코드
   private String bk_code; //isbn코드
   

}