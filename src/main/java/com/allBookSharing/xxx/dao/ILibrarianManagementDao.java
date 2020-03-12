package com.allBookSharing.xxx.dao;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Librarian;
import com.allBookSharing.xxx.dto.Library;
@Component
public interface ILibrarianManagementDao {

	boolean librarianinsert(Librarian lia);

	boolean librarianinsert2(Librarian liz);
	
	boolean librarianinsert3(Librarian lix);
	
}
