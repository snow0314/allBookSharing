package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.ReadingRoom;
import com.allBookSharing.xxx.dto.Seats;

@Component
public interface IReadingRoomManagementDao {

	int readingRoomInsert(ReadingRoom readingRoom);

	int seatInsert(List<Seats> seats);

	List<ReadingRoom> getReadingRoomList(int lb_code);

	int ReadingRoomDelete(Integer rm_code);
	
	//해당 열람실의 정보를 가져오는 메소드
	ReadingRoom getReadingRoomInfo(String rm_code);

	//해당 열람실의 좌석 정보를 가져오는 메소드
	List<Seats> getSeatInfo(String rm_code);

}
