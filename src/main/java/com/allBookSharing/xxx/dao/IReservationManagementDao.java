package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Reservation;

@Component
public interface IReservationManagementDao {

	List<Reservation> getReservationList();

	int getBookCnt(@Param("rv_code") String rv_code,@Param("rv_lcode") int rv_lcode);

	void timeLimitDown(Reservation reservation);

	int getTimeLimit(Reservation reservation);

	int bookReservationCheck(Reservation reservation);

	void bookStateChange(Reservation reservation);

}
