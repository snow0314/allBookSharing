package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dao.IUserReadingRoomManagementDao;
import com.allBookSharing.xxx.dto.Library;

@Service
public class UserReadingRoomManagement {
	
	@Autowired
	IUserReadingRoomManagementDao rDao;

	public List<Library> getZoneInfo() {
		
		List<Library> list=rDao.getZoneInfo();
		
		return list;
	}
	
}
