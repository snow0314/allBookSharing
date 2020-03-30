package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.BookExchange;
import com.allBookSharing.xxx.dto.Hope;
import com.allBookSharing.xxx.dto.Library;

@Component
public interface IHopeDao {

	List<Hope> lbHopeList(String id);

	
	//희망도서 상세보기
	Hope lbHopeDetail(int br_num);

	
	//희망도서를 보유한 도서관 보여주기
	List<Library> swapBooks(String br_bcode);


	//희망도서 반려하기
	boolean updateHopeReturn(Hope hope);

	//희망도서 신청 완료
	boolean updateHopeComplete(Hope hope);

	//상호대차 신청하기
	boolean insertExchange(BookExchange exchange);
	
	//희망도서 상태 처리중으로 변경
	boolean updateHopeProcessing(Hope hope);

	//상호대차 취소
	boolean mutualLaonCancel(Hope hope);

	//상호대차신청권수 
	BookExchange mutualLoanQty(int be_rnum);

}
