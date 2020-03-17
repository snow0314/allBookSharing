package com.allBookSharing.xxx.service;

import java.security.Principal;
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
	
	//열람실 등록 메소드
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
	//열람실 목록 가져오는 메소드
	public List<ReadingRoom> getReadingRoomList(int lb_code) {
		
		List<ReadingRoom> rList=rDao.getReadingRoomList(lb_code);
		
		return rList;
	}
	
	@Transactional
	public String ReadingRoomDelete(Integer rm_code) {
		int result=0;
		
		result=rDao.ReadingRoomDelete(rm_code);
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	
}
