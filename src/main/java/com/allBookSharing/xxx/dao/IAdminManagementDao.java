package com.allBookSharing.xxx.dao;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;
@Component
public interface IAdminManagementDao {

	
	boolean libraryinsert(Library lib);
	
}
