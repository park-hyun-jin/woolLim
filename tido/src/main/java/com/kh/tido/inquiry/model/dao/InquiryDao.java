package com.kh.tido.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.inquiry.model.vo.PageInfo;
import com.kh.tido.inquiry.model.vo.Search;

@Repository("iDao")
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("inquiryMapper.getListCount");
	}

	public ArrayList<Inquiry> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectList", null, rowBounds);
	}

	public int insertInquiry(Inquiry inquiry) {

		return sqlSession.insert("inquiryMapper.insertInquiry", inquiry);
	}

	public Inquiry selectinquiry(int iNo) {
		return sqlSession.selectOne("inquiryMapper.selectInquiry", iNo);
	}

	public int updateInquiry(Inquiry inquiry) {
	
		return sqlSession.update("inquiryMapper.updateInquiry", inquiry);
	}

	public int deleteInquiry(int iNo) {
		
		return sqlSession.update("inquiryMapper.deleteInquiry", iNo);
	}

	public ArrayList<Inquiry> searchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.searchList",search,rowBounds);
	}
}
