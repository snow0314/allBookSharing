package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.allBookSharing.xxx.dto.Loan;
import com.allBookSharing.xxx.dto.Review;

@Service
public interface IMyLibraryDao {

	List<Loan> getDeliveryList(String id);

	List<Loan> getLoanList(String id);

	List<Loan> getHopeList(String id);

	boolean bookRequestApply(Loan lan);

	Review getReview(@Param("rv_bcode") String rv_bcode,@Param("id") String id);



}
