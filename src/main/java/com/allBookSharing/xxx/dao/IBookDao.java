package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Books;

@Component
public interface IBookDao {
    
	List<Books> bookSearch(String bk_search);
	
}
