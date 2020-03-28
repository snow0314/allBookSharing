package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.BookExchange;

@Service
public interface IMutualLoanDao {

	//상호대차신청 리스트 불러오기
	List<BookExchange> getMutualLoan(int lb_code);

}
