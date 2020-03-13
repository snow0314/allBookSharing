package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.Liked;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.dto.Review;

@Component
public interface IBookDao {
    
	List<Books> bookSearch(@Param("bk_search")String bk_search,@Param("selectval") String selectval);
	Books bookDetailPage(String bk_code);
	List<Review> bookReviewList(String bk_code);
	List<Books> bookSearch(String bk_search);
	
	Boolean reservationInsert(Reservation r);
	Integer reservationConfirm(Reservation r);
	Boolean reservationCancel(Reservation r);
	
	Boolean likeInsert(Liked lk);
	Boolean likeCancel(Liked lk);
	Integer likedConfirm(Liked lk);
	

	
}
