package com.allBookSharing.xxx.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.service.ReadingRoomManagement;

@Component
public class Schedule {
	
	@Autowired
	ReadingRoomManagement rm;
	
	 @Scheduled(cron = "0 * 18 * * *") 
	 public void test() {
		 System.out.println("열람실 예약정보 초기화");
		 rm.readingRoomInitialize();
		 
	 }
	 
}
