package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.DeliveryReq;

@Component
public interface IDeliveryManagementDao { //deliveryMapper.xml

	List<DeliveryReq> getDeliveryList(String id);

	int borrowListInsert(String id);

	int borrowDetailInsert(DeliveryReq deliveryReq);

	int bookDrop(DeliveryReq deliveryReq);

	int bookState(DeliveryReq deliveryReq);

	int bookStateChange(DeliveryReq deliveryReq);

	int userPointDown(@Param("id") String id, @Param("pl_inout") int pl_inout);

	int userPointListInsert(@Param("id") String id, @Param("pl_inout") int pl_inout);

	int deliveryDelete(DeliveryReq deliveryReq);

	String userGradeCheck(String id);

}
