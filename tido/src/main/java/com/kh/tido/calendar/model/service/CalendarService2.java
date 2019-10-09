package com.kh.tido.calendar.model.service;


import com.kh.tido.calendar.model.vo.Calendar;

public interface CalendarService2 {

	public abstract int InsertCalendar(Calendar calendar);

	public abstract int deleteCalendar(int cId);

	public abstract int UpdateCalendar(Calendar calendar);
	
	
}
