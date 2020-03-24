package com.allBookSharing.xxx.dao;

import java.util.List;
import org.springframework.stereotype.Component;
import com.allBookSharing.xxx.dto.Librarian;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Question;

@Component
public interface ILibrarianManagementDao {

	boolean librarianinsert(Librarian lia);

	List<Library> getLibraryList();

	//사서가 보는 건의사항 게시판
	List<Question> lbQuestionList(String id);

}
