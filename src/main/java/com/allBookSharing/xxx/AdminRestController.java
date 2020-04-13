package com.allBookSharing.xxx;


import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.BigGroup;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.service.AdminManagement;
import com.allBookSharing.xxx.service.LibrarianManagement;

@RestController
public class AdminRestController {
	@Autowired
	private LibrarianManagement la;
	
	@Autowired
	private AdminManagement am;
	
	ModelAndView mav;

	@RequestMapping(value = "/getlibraryinfo", produces = "application/json;charset=UTF-8")
	public List<Library> getLibraryInfo() {
		List<Library> lib = la.getlibraryinfo();
		return lib;
	}
	
	@RequestMapping(value = "/getinfo", produces = "application/json;charset=UTF-8")
	public List<Library> getInfo() {
		List<Library> lib = la.getinfo();
		return lib;
	}

	@RequestMapping(value = "/librariandelete", produces = "application/json;charset=UTF-8")
	public String LibrarianDelete(String la_id) {
		
		String result= la.LibrarianDelete(la_id);

		return result;
	}

	@RequestMapping(value = "/librarynextcode", produces = "application/json;charset=UTF-8")
	public Integer getLibraryNextCode() {
		Integer code = am.getLibraryNextCode();
		
		return code;
	}
	
	@RequestMapping(value = "/librarydrop", produces = "application/json;charset=UTF-8")
	public String libraryDrop(String lb_code) {
		
		String result= am.libraryDrop(lb_code);

		return result;
	}
	

	//bar 대출 차트
		@RequestMapping(value = "/barchart" ,produces = "application/json;charset=UTF-8")
		public Map<Integer,Integer> barChart() {
			System.out.println("월별 차트 컨트롤러");
			Map<Integer,Integer> map=am.barChart();
			
			return map;
		}
		
	//pie 대출 차트
		@RequestMapping(value = "/piechart" ,produces = "application/json;charset=UTF-8")
		public List<BigGroup> pieChart() {
			System.out.println("대출차트 컨트롤러");
			List<BigGroup> bList=am.pieChart();
			
			return bList;
		}

	@RequestMapping(value = "/recommenddelete", produces = "application/json;charset=UTF-8")
	public Boolean recommendDelete(String re_bcode) {
		
		Boolean result=am.recommendDelete(re_bcode);

		return result;
	}
	@RequestMapping(value = "/recomodify", produces = "application/json;charset=UTF-8")
	public Boolean recommendModify(String re_bcode,String re_contents) {
		
		Boolean result=am.recommendModify(re_bcode,re_contents);

		return result;
	}
	
}
