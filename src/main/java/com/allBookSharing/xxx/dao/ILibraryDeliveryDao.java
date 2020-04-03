package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.LibraryDelivery;

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

}
