package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dao.IDeliveryManagementDao;
import com.allBookSharing.xxx.dto.DeliveryReq;

@Service
public class DeliveryManagement {
	
	@Autowired
	IDeliveryManagementDao Dao;
	
	public List<DeliveryReq> getDeliveryList(String id) {
		List<DeliveryReq> dList = Dao.getDeliveryList(id);
		
		return dList;
	}

}
