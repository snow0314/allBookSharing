package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.LibraryDelivery;
import com.allBookSharing.xxx.dto.Reservation;

@Service
public interface ILibraryDeliveryDao {

	//사서 배송관리 목록
	List<LibraryDelivery> getDeliveryList(int lb_code);

	//사서 배송 상세 보기
	List<LibraryDelivery> getLbDeliveryDetail(LibraryDelivery ld);

	
	//사서 배송 취소
	boolean lbDeliveryCancel(LibraryDelivery ld);

	//사서 배송 완료
	boolean lbDeliveryComplete(LibraryDelivery ld);

	//사서 반납관리 목록
	List<LibraryDelivery> getReturnDeliveryList(int lb_code);

	//사서 반납신청 상세보기
	LibraryDelivery getReturnbooksdetail(LibraryDelivery ld);

	
	//예약여부 확인
	List<Reservation> getReservationCheck(LibraryDelivery ld);

	
	//반납완료
	boolean updateReturnBookComplete(LibraryDelivery ld);

	//책 반납 대출상태(예약이 없을때)
	boolean updateReturnBooksNull(LibraryDelivery ld);

	//책 반납 대출상태(예약이 있을떄)
	boolean updateReturnBooksNotNull(LibraryDelivery ld);

}
