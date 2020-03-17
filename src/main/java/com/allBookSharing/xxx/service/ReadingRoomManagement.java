package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allBookSharing.xxx.dao.IReadingRoomManagementDao;
import com.allBookSharing.xxx.dto.ReadingRoom;
import com.allBookSharing.xxx.dto.Seats;

@Service
public class ReadingRoomManagement {

	@Autowired
	IReadingRoomManagementDao rDao;
	
	@Transactional
	public String readingRoomInsert(ReadingRoom readingRoom) {
		int result=rDao.readingRoomInsert(readingRoom);
		
		List<Seats> seats=readingRoom.getSeats();		
		result+=rDao.seatInsert(seats);
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	
}
