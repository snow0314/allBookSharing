package com.allBookSharing.xxx.dao;

import java.util.List;
import org.springframework.stereotype.Component;
import com.allBookSharing.xxx.dto.Librarian;
import com.allBookSharing.xxx.dto.Library;

@Component
public interface ILibrarianManagementDao {

	boolean librarianinsert(Librarian lia);

	List<Library> getLibraryList();
}
