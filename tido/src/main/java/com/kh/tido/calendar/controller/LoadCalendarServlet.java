package calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import calendar.model.service.CalendarService;
import calendar.model.vo.Calendar;
import oracle.sql.DATE;

@WebServlet("/loadCalendar.do")
public class LoadCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoadCalendarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		ArrayList<Calendar> list = null;
		
		
//		request.setAttribute("eventList", list);
//		RequestDispatcher view = request.getRequestDispatcher("views/calendar/calendar.jsp");
//		view.forward(request, response);
		
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
			map.put(i, cal);
		}
		
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(map, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
