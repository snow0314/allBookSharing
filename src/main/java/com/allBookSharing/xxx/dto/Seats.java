package com.allBookSharing.xxx.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Alias("seats")
@Data
@NoArgsConstructor
@Accessors(chain=true)
public class Seats {
	private int se_low; //행
	private int se_col; //열
	private int se_code; //열람실 코드
	private String se_id; //아이디
	private Timestamp se_date; //예약한 날짜
	private int se_place; //좌석 상태
}
