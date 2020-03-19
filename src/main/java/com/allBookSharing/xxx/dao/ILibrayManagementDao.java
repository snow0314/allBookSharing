package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Schedule;

@Component
public interface ILibrayManagementDao {
	
	Library getLibraryInfo(int lb_code);

	boolean libraryModify(Library lib);

	List<Schedule> getLibraryCalendarInfo(int lb_code);

	boolean setLibraySchedule(Schedule schedule);

}
