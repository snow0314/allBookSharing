package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;

@Component
public interface IUserReadingRoomManagementDao { //userReadingRoomMapper.xml과 연결

	List<Library> getZoneInfo();
	
}
