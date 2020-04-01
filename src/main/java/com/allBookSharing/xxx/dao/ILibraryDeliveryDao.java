package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.LibraryDelivery;

@Service
public interface ILibraryDeliveryDao {

	//배송관리 목록
	List<LibraryDelivery> getDeliveryList(int lb_code);

}
