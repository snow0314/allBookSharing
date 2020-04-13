package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.ReadingRoom;
import com.allBookSharing.xxx.dto.Seats;

@Component
public interface IReadingRoomManagementDao { //ReadingRoomMapper.xml

	int readingRoomInsert(ReadingRoom readingRoom);

	int seatInsert(List<Seats> seats);

	List<ReadingRoom> getReadingRoomList(int lb_code);

	int ReadingRoomDelete(Integer rm_code);
	
	//해당 열람실의 정보를 가져오는 메소드
	ReadingRoom getReadingRoomInfo(String rm_code);

	//해당 열람실의 좌석 정보를 가져오는 메소드
	List<Seats> getSeatInfo(String rm_code);
	
	//열람실 테이블의 정보를 수정
	int readingRoomModify(ReadingRoom readingRoom);
	
	//좌석 테이블의 정보를 수정
	int seatModify(@Param("list") List<Seats> seats,@Param("code") int code);

	//열람실 예약정보 초기화
	void readingRoomInitialize();
	
	//선택한 열람실 좌석 예약 취소
	boolean readingRoomCancel(Seats seat);
	
	//해당 열람실의 모든 예약 취소
	boolean readingRoomAllCancel(int rm_code);

}
