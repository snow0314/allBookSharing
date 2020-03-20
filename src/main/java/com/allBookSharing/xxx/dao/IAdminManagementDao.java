package com.allBookSharing.xxx.dao;


import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;
@Component
public interface IAdminManagementDao { //AdminMapper.xml
	
	boolean libraryinsert(Library lib);
	
	List<Library> getLibraryList();

	List<Library> getlibraryinfo();


	int LibrarianDelete(String la_id);

	//등록할 도서관 코드 가져오는 메소드
	Integer getLibraryNextCode();
	
	
}
