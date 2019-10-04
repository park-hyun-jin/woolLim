package com.kh.tido.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int saveProject(Project project) {
		
		return sqlSession.insert("projectMapper.saveProject",project);
	}

	public Project openProject(int pNo) {
		return sqlSession.selectOne("projectMapper.openProject", pNo);
	}

	public ArrayList<Project> selectProjectList(Project project) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList",project);
	}
	
	
	
}
