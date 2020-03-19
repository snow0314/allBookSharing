package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.Loan;

@Service
public interface IMyLibraryDao {

	List<Loan> getDeliveryList(String id);

	List<Loan> getLoanList(String id);

}
