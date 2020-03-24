package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.ReadingRoom;

@Component
public interface IUserReadingRoomManagementDao { //userReadingRoomMapper.xml과 연결

	List<Library> getZoneInfo();

	List<ReadingRoom> getReadingRoomInfo(int lb_code);

	Integer numberOfSeatsInUse(@Param("rm_code") int rm_code,@Param("se_place") int se_place);

	
}
