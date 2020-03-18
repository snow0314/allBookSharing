package com.allBookSharing.xxx.dao;


import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.BigGroup;
import com.allBookSharing.xxx.dto.LikedList;
import com.allBookSharing.xxx.dto.LikedList2;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Member;
import com.allBookSharing.xxx.dto.PointList;
import com.allBookSharing.xxx.dto.Reservation;
@Service
public interface IMemberDao {
	
	@Select("SELECT * FROM VIEW_MEMBER WHERE MB_ID=#{id}")
	Member getMyPage(String id);
	@Select("SELECT COUNT(*) FROM BORROWLIST WHERE BO_ID=#{id}")
	int getBorrowCnt(String id);

	//연체횟수
	@Select("SELECT COUNT(BD_RETURN_DATE-BD_REAL_RETURN_DATE) FROM VEIW_BRROW WHERE BO_ID=#{id} AND (BD_RETURN_DATE-BD_REAL_RETURN_DATE)<0")
	int getArrearsCnt(String id);

	
	//리뷰횟수(독서횟수)
	@Select("SELECT COUNT(*) FROM REVIEW WHERE RV_ID=#{id}")
	int getReviewcntCnt(String id);
	
	//누적 연체일수
	@Select("SELECT SUM(BD_RETURN_DATE-BD_REAL_RETURN_DATE) FROM VEIW_BRROW WHERE BO_ID=#{id} AND (BD_RETURN_DATE-BD_REAL_RETURN_DATE)<0")
	int getArrearsDay(String id);
	
	@Select(
			"SELECT bo_num,bk_name,bd_date,bd_return_date FROM BORROWLIST \r\n" + 
			"JOIN BORROWDETAIL ON BO_NUM=BD_BO_NUM \r\n" + 
			"JOIN BOOKS ON BD_BCODE=BK_CODE WHERE BO_ID=#{id}")
	List<Loan> getLoanList(String id);
	
	
	List<Loan> getArrearsList(String id);
	
	@Update("update member set mb_pw=#{pw} where mb_id=#{id}")
	boolean updatePassword(@org.apache.ibatis.annotations.Param("id") String id,@org.apache.ibatis.annotations.Param("pw") String pw);
	
	
	boolean updateprofileUs(Member mb1);

	boolean updateprofileMb(Member mb1);

	@Select("SELECT * FROM POINTLIST WHERE pl_id=#{id} ORDER by pl_date desc")	
	List<PointList> getPointList(String id);
	
	@Delete("DELETE FROM MEMBER WHERE MB_ID=#{id}")
	boolean memberDrop(String id);
	
	@Delete("DELETE FROM USERS WHERE US_ID=#{id}")
	boolean memberDrop2(String id);
	
	@Delete("DELETE FROM AUTHORITIES WHERE ID=#{id}")
	boolean memberDrop3(String id);
	
	//대출차트
	List<BigGroup> getBorrowChart(String id);
	
	@Select("SELECT MB_AREA FROM MEMBER WHERE MB_ID=#{id}")
	String myRegion(String id);
	
	
	//반납연장하기
	int loanExtend(int bd_bo_num);
	
	//현재 예약 목록
	List<Reservation> getReservationlist(String id);
	
	//찜목록
	List<LikedList> showWishList(String id);
	
	
	//찜목록 삭제
	int deletLikedList(@Param("delete") List<LikedList2> list3);
	
	//포인트 충전
	@Update("update users set us_point=#{us_point}+us_point where us_id=#{mb_id}")
    boolean updateOkPoint(Member mb);
	//포인트 충전내역
	@Insert("INSERT INTO POINTLIST VALUES(SEQ_POINT.NEXTVAL,#{mb_id},#{us_point},'충전',DEFAULT)")
	boolean insertPointList(Member mb);
	
	
	
	
	

}



