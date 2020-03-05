package com.allBookSharing.xxx.dao;

import org.apache.ibatis.annotations.Select;

import com.allBookSharing.xxx.dto.Member;

public interface IMemberDao {
	
	@Select("SELECT * FROM VIEW_MEMBER WHERE MB_ID=#{id}")
	Member getMyPage(String id);

}
