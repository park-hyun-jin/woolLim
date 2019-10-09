package com.kh.tido.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.calendar.model.dao.CalendarDao;
import com.kh.tido.calendar.model.vo.Calendar;

@Service("cService")
public class CalendarServiceImpl2 implements CalendarService2{

	@Autowired
	private CalendarDao cDao;

	
	@Override
	public int InsertCalendar(Calendar calendar) {
	
		int result = cDao.InsertCalendar(calendar);
		
		return result;
	}


	@Override
	public int deleteCalendar(int cId) {

		int result = cDao.deleteCalendar(cId);
		
		return result;
	}


	@Override
	public int UpdateCalendar(Calendar calendar) {
		
		int result = cDao.UpdateCalendar(calendar);
		
		return result;
	}



	
	
	
	
}
