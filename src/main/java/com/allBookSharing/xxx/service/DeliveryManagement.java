package com.allBookSharing.xxx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allBookSharing.xxx.dao.IDeliveryManagementDao;
import com.allBookSharing.xxx.dto.DeliveryReq;

@Service
public class DeliveryManagement { 
	
	@Autowired
	IDeliveryManagementDao Dao;
	
	public List<DeliveryReq> getDeliveryList(String id) {
		List<DeliveryReq> dList = Dao.getDeliveryList(id);
		
		return dList;
	}
	
	
	//1.대출목록 테이블 추가
	//2.대출 상세 테이블 추가
	//3.사용자 테이블 포인트 삭감
	//4.포인트 거래내역 테이블에 추가
	@Transactional
	public String borrowListInsert(List<DeliveryReq> dList, String id, String pl_inout) {
		int result=0;
		result=Dao.borrowListInsert(id); //대출목록 테이블에 추가
		
		for(int i=0;i<dList.size();i++) {
			System.out.println("데이터확인:"+dList.get(i).toString());
		}
		
		for(int i=0;i<dList.size();i++) {
			result+=Dao.borrowDetailInsert(dList.get(i)); //대출상세 테이블에 추가
			result+=Dao.bookDrop(dList.get(i)); //책 테이블의 대출중인 책 증가
			dList.get(i).setDe_id(id);
			result+=Dao.deliveryDelete(dList.get(i)); //배송 신청한 책은 장바구니에서 지우기
			int cnt = Dao.bookState(dList.get(i)); //보유권수 - 대출중인 책 권수 구하기
			if(cnt==0) {
				result+=Dao.bookStateChange(dList.get(i)); //보유권수 - 대출중인 책이 0이면 대출불가능 상태로 변경
			}
		}
		result +=Dao.userPointDown(id,Integer.parseInt(pl_inout)); //사용자 포인트 삭감
		result +=Dao.userPointListInsert(id,Integer.parseInt(pl_inout)); //포인트 리스트에 기록
		
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
		
	}

	//사용자 등급 체크
	public String userGradeCheck(String id) {
		
		return Dao.userGradeCheck(id);
	}

}
