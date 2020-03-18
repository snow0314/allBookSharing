package com.allBookSharing.xxx.dao;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;

@Component
public interface ILibrayManagementDao {
	
	Library getLibraryInfo(int lb_code);

}
