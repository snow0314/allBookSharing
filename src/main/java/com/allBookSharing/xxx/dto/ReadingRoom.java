package com.allBookSharing.xxx.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Alias("readingRoom")
@Data
@NoArgsConstructor
@Accessors(chain=true)
public class ReadingRoom {
	private int rm_code; //열람실 코드
	private int rm_lcode; //도서관 코드
	private String rm_name; //열람실 이름
	private int rm_low; //행
	private int rm_col; //열
	private List<Seats> seats;
	private int totalSeat; //전체 좌석 수
	private int numberOfSeatsInUse; //사용중인 좌석 수
	private int numberOfSeatsAvailable; //잔여 좌석 수
	
}
