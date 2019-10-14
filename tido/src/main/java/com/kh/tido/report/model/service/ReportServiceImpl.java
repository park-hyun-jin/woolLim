package com.kh.tido.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.report.model.dao.ReportDao;
import com.kh.tido.report.model.vo.Report;



@Service("rService")
public class ReportServiceImpl implements ReportService{
	
	@Autowired ReportDao rDao;

	@Override
	public int insertReport(Report report) {
		report.setrReportContent(report.getrReportContent().replace("\n", "<br>"));
		return rDao.insertReport(report);
	}

}
