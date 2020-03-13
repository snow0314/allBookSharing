package com.allBookSharing.xxx.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("pointlist")
public class PointList {
int pl_num;
String pl_id;
int pl_inout;
Date pl_date;
String pl_contents;

}
