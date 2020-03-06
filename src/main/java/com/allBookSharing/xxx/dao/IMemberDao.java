package com.allBookSharing.xxx.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Select;

import com.allBookSharing.xxx.dto.Member;

public interface IMemberDao {
	
	@Select("SELECT * FROM VIEW_MEMBER WHERE MB_ID=#{id}")
	Member getMyPage(String id);
	@Select("SELECT COUNT(*) FROM BORROWLIST WHERE BO_ID=#{id}")
	int getBorrowCnt(String id);
	
	@Select("SELECT BD_RETURN_DATE FROM BORROWDETAIL JOIN BORROWLIST ON BORROWDETAIL.BD_BO_NUM=borrowlist.bo_num WHERE BO_ID=#{id}")
	Date getArrearsCnt(String id);
	@Select("SELECT COUNT(*) FROM BORROWDETAIL JOIN BORROWLIST ON BORROWDETAIL.BD_BO_NUM=borrowlist.bo_num WHERE BO_ID=#{id} AND BD_BO_NUM=9")
	int getArrearsCnt2(String id);
	
	@Select("SELECT COUNT(*) FROM REVIEW WHERE RV_ID=#{id}")
	int getReviewcntCnt(String id);

}
