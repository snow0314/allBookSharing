package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;
@Component
public interface IAdminManagementDao {

	
	boolean libraryinsert(Library lib);

	List<Library> getLibraryList();
	
	
}
