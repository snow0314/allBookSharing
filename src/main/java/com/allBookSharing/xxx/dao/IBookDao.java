package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Liked;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.dto.Review;
@Service
@Component
public interface IBookDao {
    
	List<Books> bookSearch(@Param("bk_search")String bk_search,@Param("selectval") String selectval);
	Books bookDetailPage(@Param("bk_code")String bk_code, @Param("bk_lcode")String bk_lcode);
	List<Review> bookReviewList(String bk_code);
	List<Books> bookSearch(String bk_search);
	
	Boolean reservationInsert(Reservation r);
	Integer reservationConfirm(Reservation r);
	Boolean reservationCancel(Reservation r);
	
	Boolean likeInsert(Liked lk);
	Boolean likeCancel(Liked lk);
	Integer likedConfirm(Liked lk);
	Integer likeCount(Liked lk);
	
	Integer deliCount(DeliveryReq dr);
	Boolean deliInsert(DeliveryReq dr);
	
	List<Books> myRegionSearch(@Param("bk_search")String bk_search, @Param("selectval")String selectval,@Param("region")String region);

	
	List<Library> myRegionLib(@Param("bk_search")String bk_search, @Param("selectval")String selectval, @Param("region")String region);
	List<Books> regionLibSearch(@Param("bk_search")String bk_search, @Param("selectval")String selectval, @Param("bk_lcode")Integer bk_lcode);
	List<Books> jiyuckSearch(@Param("bk_search")String bk_search, @Param("selectval")String selectval,@Param("bk_loc") String bk_loc);
	
	List<Loan> bestList(Loan l);
	Books topDetailPage(String bk_code);
	List<Loan> mainPageTopTen(Loan lo);
	
	
	

	
}
