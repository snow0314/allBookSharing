package com.allBookSharing.xxx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dao.IlibrayBookManagementDao;
import com.allBookSharing.xxx.dto.Classification;

@Service
public class librayBookManagement {

	@Autowired
	IlibrayBookManagementDao lDao;
	
	public List<Classification> getBigGroup() {
		
		List<Classification> bList=lDao.getBigGroup();
		
		return bList;
	}

}
