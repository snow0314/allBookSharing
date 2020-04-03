package com.allBookSharing.xxx.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.allBookSharing.xxx.service.ReservationManagement;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class ScheduleTest {
	
	@Autowired
	ReservationManagement rtm;
	
	
	@Test
	
	public void reservationTimeLimitTest() {
		 System.out.println("예약정보 삭제"); 
		 rtm.reservationTimeLimit();
	 }
	
	
	/*
	 * @Test public void testExist() { log.info("bm={}",bm); assertThat(bm,
	 * is(notNullValue())); }
	 * 
	 * @Test
	 * 
	 * @SuppressWarnings("unchecked") public void testGetList() { List<Board>
	 * bList=(List<Board>) bm.getBoardList(1).getModelMap().getAttribute("bList");
	 * bList.forEach(b->log.info("b={}",b));
	 * 
	 * // for(Board b: bList) { // log.info("bb={}",b); // }
	 * assertThat(bList.size(), is(10)); //assertThat(bm, is(notNullValue())); }
	 */
	

	
}
