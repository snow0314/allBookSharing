package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.BookExchange;

@Service
public interface IMutualLoanDao {

	//상호대차신청 리스트 불러오기
	List<BookExchange> getMutualLoan(int lb_code);

	//상호대차 상세보기
	BookExchange mutaulLoanDetail(int be_num);

	//상호대차 수락하면 해당 도서의 보유권수를 차감
	boolean updateMutulLoanQty(BookExchange bookEx);

	//상호대차 신청 상태를 1(수락)으로 update
	boolean updateMutulLoanState(BookExchange bookEx);
	
	//희망도서 테이블 상태값을 5(상호대차수락)으로 update
	boolean updateHopeState(BookExchange bookEx);

	//상호대차 거절 (상태 업데이트(거절))
	boolean updateMutulLoanFalse(BookExchange bookEx);
	//상호대차 거절 (희망도서테이블 상태 업데이트)
	boolean updateHopeStateFalse(BookExchange bookEx);

}
