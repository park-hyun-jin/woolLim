package com.kh.tido.visitor.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.visitor.model.vo.VisitorCount;

@Repository("vDao")
public class VisitorDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertVisitor(VisitorCount vc) {		
		return sqlSession.insert("visitorMapper.insertVisitor", vc);
	}

	public int checkVisitor(VisitorCount vc) {
		return sqlSession.selectOne("visitorMapper.checkVisitor", vc);
	}

	public String selectVisitor() {		
		return sqlSession.selectOne("visitorMapper.selectVisitor");
	}

}
