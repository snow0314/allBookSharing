package com.allBookSharing.xxx.dao;

import java.util.List;

import com.allBookSharing.xxx.dto.Notice;

public interface NoticeDao {
    //공지사항
	List<Notice> getNoticeList();
    //공지사항 글 상세보기
	Notice getNoticeDetail(Notice ntc2);
	
	//공지사항 글쓰기
	boolean noticeWrite(Notice ntc);
	//공지사항 글 삭제
	boolean deleteNotice(Notice ntc);

}
