package com.kh.tido.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.report.model.vo.Report;

@Repository("rDao")
public class ReportDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReport(Report report) {
	
		return sqlSession.insert("reportMapper.insertList", report);
	}

}
