package com.allBookSharing.xxx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dao.IReadingRoomManagementDao;
import com.allBookSharing.xxx.dao.IUserReadingRoomManagementDao;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.ReadingRoom;
import com.allBookSharing.xxx.dto.Seats;
import com.google.gson.Gson;

@Service
public class UserReadingRoomManagement {
	
	@Autowired
	IUserReadingRoomManagementDao rDao;
	
	@Autowired
	IReadingRoomManagementDao rDao2;
	
	ModelAndView mav;

	public List<Library> getZoneInfo() {
		
		List<Library> list=rDao.getZoneInfo();
		
		return list;
	}

	public List<ReadingRoom> getReadingRoomInfo(String lb_code) {
		
		List<ReadingRoom> list=rDao.getReadingRoomInfo(Integer.parseInt(lb_code));
		
		return list;
	}

	public ModelAndView readingRoomReservationMove(String rm_code, String rm_lcode) {
		mav = new ModelAndView();
		ReadingRoom readingRoom = rDao2.getReadingRoomInfo(rm_code);
		List<Seats> seats=rDao2.getSeatInfo(rm_code);
		readingRoom.setSeats(seats);
		//해당 도서관에 속하는 열람실 리스트 가져오기
		List<ReadingRoom> list=rDao.getReadingRoomInfo(Integer.parseInt(rm_lcode));
		Library lib = rDao.getLibName(Integer.parseInt(rm_lcode));
		
		Gson gson=new Gson();
		
		mav=new ModelAndView();
		mav.addObject("readingRoom", gson.toJson(readingRoom));
		mav.addObject("readingRoomList", gson.toJson(list));
		mav.addObject("libName", lib.getLb_name());
		mav.setViewName("readingRoomReservation");
		
		
		return mav;
	}
	
	//열람실의 사용중인 좌석수 구하는 메소드
	public Map<String, Integer> numberOfSeatsInUse(String rm_code) {
		
		int numberOfSeatsInUse = rDao.numberOfSeatsInUse(Integer.parseInt(rm_code),2);
		int numberOfSeatsAvailable = rDao.numberOfSeatsInUse(Integer.parseInt(rm_code),1);
		Map<String, Integer> sMap=new HashMap<String, Integer>();
		sMap.put("numberOfSeatsInUse", numberOfSeatsInUse);
		sMap.put("numberOfSeatsAvailable", numberOfSeatsAvailable);
		
		
		return sMap;
	}

	public String readingRoomReservation(Seats seats) {
		int check = rDao.readingRoomReservationCheck(seats.getSe_id());
		if(check == 0) {
			int result = rDao.readingRoomReservation(seats);
			
			if(result!=0) {
				return "예약에 성공하셨습니다.";
			}else {
				return "실패";
			}
		}else {
			return "이미 예약한 회원입니다.";
		}
		
		
	}
	
	//열람실 예약 확인
	public Seats userReadingRoomReservationCheck(String id) {
		
		return rDao.userReadingRoomReservationCheck(id);
	}
	
	//열람실 예약 취소
	public String userReadingRoomReservationCancel(String id) {
		
		boolean result = rDao.userReadingRoomReservationCancel(id);
		
		if(result) {
			return "예약을 취소했습니다.";
		}else {
			return "실패";
		}
		
	}
	
}
