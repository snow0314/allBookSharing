package com.allBookSharing.xxx.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.jboss.logging.Param;

import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Member;

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
	
	@Select("SELECT SUM(BD_RETURN_DATE-BD_REAL_RETURN_DATE) FROM VEIW_BRROW WHERE BO_ID=#{id} AND (BD_RETURN_DATE-BD_REAL_RETURN_DATE)<0")
	int getArrearsDay(String id);
	
	@Select("SELECT bo_num,bk_name,bd_date,bd_return_date FROM BORROWLIST \r\n" + 
			"JOIN BORROWDETAIL ON BO_NUM=BD_BO_NUM \r\n" + 
			"JOIN BOOKS ON BD_BCODE=BK_CODE WHERE BO_ID=#{id}")
	List<Loan> getLoanList(String id);
	
	@Select("SELECT bo_num,bk_name,bd_date,bd_real_return_date,bd_date-bd_real_return_date as arrearsday  FROM BORROWLIST \r\n" + 
			"JOIN BORROWDETAIL ON BO_NUM=BD_BO_NUM \r\n" + 
			"JOIN BOOKS ON BD_BCODE=BK_CODE WHERE BO_ID=#{id}")
	List<Loan> getArrearsList(String id);
	
	@Update("update member set mb_pw=#{pw} where mb_id=#{id}")
	boolean updatePassword(@org.apache.ibatis.annotations.Param("id") String id,@org.apache.ibatis.annotations.Param("pw") String pw);
	
	
	
	

}
