package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.DeliveryReq;

@Component
public interface IDeliveryManagementDao { //deliveryMapper.xml

	List<DeliveryReq> getDeliveryList(String id);

}
