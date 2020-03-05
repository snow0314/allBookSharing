package com.allBookSharing.xxx.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.Member;

@Service
public interface IjoinMangementDao {
	@Select("select * from member where mb_id=#{id}")
	Member idfind(String id);

	boolean memberJoin(Member mb);

}
