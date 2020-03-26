package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.Loan;
import com.sun.tools.internal.ws.processor.model.Request;

@Service
public interface IMyLibraryDao {

	List<Loan> getDeliveryList(String id);

	List<Loan> getLoanList(String id);

	List<Loan> getHopeList(String id);

	boolean bookrRequestApply(Loan lan);
	
	

}
