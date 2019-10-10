package com.kh.tido.inquiry.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("iDao")
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
