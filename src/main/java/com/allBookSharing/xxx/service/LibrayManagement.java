package com.allBookSharing.xxx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.allBookSharing.xxx.dao.ILibrayManagementDao;
import com.allBookSharing.xxx.dto.Library;

@Service
public class LibrayManagement {

	@Autowired
	ILibrayManagementDao lDao;
	
	//자기가 속한 도서관의 정보를 가져오는 메소드
	public Library getLibraryInfo(int lb_code) {
		
		Library library=lDao.getLibraryInfo(lb_code);
		
		return library;
	}

}
