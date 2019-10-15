package com.kh.tido.projectBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.projectBoard.model.vo.ProjectBoard;

@Repository("pbDao")
public class ProjectBoardDao {
	
	@Autowired
	private SqlSession sqlSession ;
	
	public int getpbListCount() {
		return sqlSession.selectOne("pboardMapper.getpbListCount");
	}

	public ArrayList<ProjectBoard> selectpBoardList(PageInfo pi) {
	    int offset = (pi.getCurrentPage()-1)* pi.getLimit();
	    RowBounds rb = new RowBounds(offset,pi.getLimit());
		return (ArrayList)sqlSession.selectList("pboardMapper.selectpBoardList",null,rb);
	}

}
