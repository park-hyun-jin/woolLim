package com.kh.tido.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.calendar.model.vo.Calendar;

@Repository("cDao")
public class CalendarDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int InsertCalendar(Calendar calendar) {
		System.out.println("dao까지 왔을 떄 calendar : " + calendar);
		return sqlSession.insert("calendarMapper.InsertCalendar",calendar);
	}


	public int deleteCalendar(int cId) {
		
		return sqlSession.delete("calendarMapper.deleteCalendar",cId);
	}


	 public int UpdateCalendar(Calendar calendar) {
	      return sqlSession.selectList("calendarMapper.UpdateCalendar",calendar);
	   }



	public ArrayList<Calendar>loadCalendar() {
		
		return (ArrayList)sqlSession.selectList("calendarMapper.loadCalendar");
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
