package com.allBookSharing.xxx.dao;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Question;

@Component
public interface QuestionDao {

	//건의사항 글쓰기 페이지 이동
	List<Question> getQuestionList();
    
	//건의사항 글쓰기
	boolean questionWrite(Question qus);

	//건의사항 상세글보기
	Question getQuestionDetail(Question qus2);

	
}
