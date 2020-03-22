package com.allBookSharing.xxx.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dao.IReadingRoomManagementDao;
import com.allBookSharing.xxx.dto.ReadingRoom;
import com.allBookSharing.xxx.dto.Seats;
import com.google.gson.Gson;

@Service
public class ReadingRoomManagement {

	@Autowired
	IReadingRoomManagementDao rDao;
	
	ModelAndView mav;
	
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
	//열람실 삭제하는 메소드
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
	//열람실 수정 페이지로 이동하는 메소드, 이동하면서 해당 열람실의 정보를 가져온다
	public ModelAndView readingRoomModifyMove(String rm_code) {
		ReadingRoom readingRoom=rDao.getReadingRoomInfo(rm_code);
		List<Seats> seats=rDao.getSeatInfo(rm_code);
		readingRoom.setSeats(seats);
		Gson gson=new Gson();
		
		mav=new ModelAndView();
		mav.addObject("readingRoom", gson.toJson(readingRoom));
		mav.setViewName("librarian/readingRoomModify");
		
		return mav;
	}
	
}
