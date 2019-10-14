package com.kh.tido.calendar.controller;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.tido.calendar.model.service.CalendarService2;
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
	@RequestMapping(value="insertCalendar.kh", method=RequestMethod.GET)
	public int InsertCalendar(Calendar calendar) {
		System.out.println("insertCalendar.kh 까지 왔음");
		System.out.println("calendar : " + calendar);
		
		int result = cService.InsertCalendar(calendar);
		System.out.println(result);
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteCalendar.kh",method=RequestMethod.GET )
	public int DeleteCalendar(int cId) {
		
		int result =  cService.deleteCalendar(cId);
		
		return result;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="loadCalendar.kh",method=RequestMethod.GET )
	public String LoadCalendar() {
		
		ArrayList<Calendar> list = cService.loadCalendar();
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		
		JSONObject cal = null;
		
		JSONObject map = new JSONObject();
		
		for(int i=0; i<list.size(); i++) {
			Calendar tmp = list.get(i);
			cal = new JSONObject();
			
			cal.put("id", tmp.getcId());
			cal.put("title", tmp.getcTitle());
			cal.put("url", tmp.getcUrl());
			cal.put("startDate", ft.format(tmp.getcStartDate()));
			cal.put("endDate", ft.format(tmp.getcEndDate()));
			cal.put("status", tmp.getcStatus());
			
			map.put(i, cal);
		}
		
		return new GsonBuilder().create().toJson(map);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="updateCalendar.kh",method=RequestMethod.GET)
	public int UpdateCalendar(@ModelAttribute  Calendar calendar) {
		
		System.out.println(calendar);
		int result = cService.UpdateCalendar(calendar);
		

		
		return result;
	}
	
	
	
}
