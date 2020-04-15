package com.allBookSharing.xxx.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.service.ReadingRoomManagement;
import com.allBookSharing.xxx.service.ReservationManagement;

@Component
public class Schedule {
	
	@Autowired
	ReadingRoomManagement rm;
	
	@Autowired
	ReservationManagement rtm;
	
	 @Scheduled(cron = "0 * 18 * * *") 
	 public void readingRoomInitialize() {
		 System.out.println("열람실 예약정보 초기화");
		 rm.readingRoomInitialize();
	 }
	 
	 @Scheduled(cron = "0 0/1 * * * *") 
	 public void reservationTimeLimit() {
		 System.out.println("예약정보 삭제");
		 rtm.reservationTimeLimit();
	 }
	 
	 
}
