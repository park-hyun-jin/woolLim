package com.kh.tido.calendar.model.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tido.calendar.model.service.CalendarService2;
import com.kh.tido.calendar.model.service.CalendarServiceImpl2;
import com.kh.tido.calendar.model.vo.Calendar;



@Controller
public class CalenderController {

	@Autowired
	private CalendarService2 cService;
	
	@RequestMapping("adminMain.kh")
	public String AdminCalendar() {
		return "calendar/calendarAdmin";
	}
	
	@ResponseBody
	@RequestMapping(value="insertCalendar.kh", method=RequestMethod.GET )
	public int InsertCalendar(Calendar calendar) {
		
		int result = cService.InsertCalendar(calendar);
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteCalendar.kh",method=RequestMethod.GET )
	public int DeleteCalendar(int cId) {
		
		int result =  cService.deleteCalendar(cId);
		
		return result;
		
		
	}
	@ResponseBody
	@RequestMapping(value="updateCalendar.kh",method=RequestMethod.GET)
	public int UpdateCalendar(Calendar calendar) {
		
		int result = cService.UpdateCalendar(calendar);
		
		return result;
		
		
	}
	
	public int LoadCalendarServlet() {
		
		
		ArrayList<Calendar> list = null;
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		
		JSONObject cal = null;
		
		JSONObject map = new JSONObject();
		
		for(int i=0; i<list.size(); i++) {
			Calendar tmp = list.get(i);
			cal = new JSONObject();
			
			cal.put("id", tmp.getId());
			cal.put("title", tmp.getTitle());
			cal.put("url", tmp.getUrl());
			cal.put("date", ft.format(tmp.getDate()));
			cal.put("status", tmp.getStatus());
			cal.put("code", tmp.getCode());
			
			map.put(i, cal);
		}
		
	}
	
	
	
	
	
	
	
	
	
}
