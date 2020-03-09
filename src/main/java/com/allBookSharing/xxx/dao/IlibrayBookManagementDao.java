package com.allBookSharing.xxx.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Classification;

@Component
public interface IlibrayBookManagementDao {

	List<Classification> getBigGroup();

	List<Classification> getSmallGroup(Integer BigNum);

	boolean bookInsert(Books book);

}
