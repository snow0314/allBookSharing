package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dao.IMemberDao;
import com.allBookSharing.xxx.dao.IReservationManagementDao;
import com.allBookSharing.xxx.dto.Reservation;

@Service
public class ReservationManagement {
	
	@Autowired
	IReservationManagementDao rDao;
	
	@Autowired
	IMemberDao mDao;

	public void reservationTimeLimit() {
		int cnt;
		int rank;
		int timeLimit=0;
		int check=0;
		List<Reservation> rList = rDao.getReservationList();
		System.out.println("예약정보 리스트"+rList.toString());
		
		for(int i=0;i<rList.size();i++) {
			//예약 정보 테이블에 있는 책의 대출가능 권수를 구하는 메소드
			cnt = rDao.getBookCnt(rList.get(i).getRv_code(),rList.get(i).getRv_lcode());
			System.out.println("대출가능 권수:"+cnt);
			
			if(cnt<1) { 
				continue;
			}
			//반납이 들어와 대출이 가능한 상태의 책이면 시간제한을 감소시킨다
			rank =mDao.getreservationRank(rList.get(i)); //랭크 가져오는 메소드
			System.out.println("랭크:"+rank);
			
			if(cnt >= rank) {
				rDao.timeLimitDown(rList.get(i)); //시간제한 감소시키는 메소드
				timeLimit = rDao.getTimeLimit(rList.get(i));
				System.out.println("시간제한:"+timeLimit);
			}
			if(timeLimit != -1) { 
				continue;
			}
			//시간제한이 -1이면 예약목록에서 삭제
			mDao.reservationcancell(Integer.parseInt(rList.get(i).getRv_num()));
			System.out.println("예약삭제");
			check = rDao.bookReservationCheck(rList.get(i));
			if(check != 0) {
				continue;
			}
			rDao.bookStateChange(rList.get(i));
			System.out.println("책 상태 변경");
		}
		
	}

}
