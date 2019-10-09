package com.kh.tido.calendar.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tido.calendar.model.vo.Calendar;

@Repository("cDao")
public class CalendarDao {
	
	private SqlSessionTemplate sqlSession;
	
	
	public int InsertCalendar(Calendar calendar) {
		
		return sqlSession.insert("calendar-mapper.InsertCalendar",calendar);
	}


	public int deleteCalendar(int cId) {
		
		return sqlSession.delete("calendar-mapper.deleteCalendar",cId);
	}


	public int UpdateCalendar(Calendar calendar) {
		
		return sqlSession.update("calendar-mapper.UpdateCalendar",calendar);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
