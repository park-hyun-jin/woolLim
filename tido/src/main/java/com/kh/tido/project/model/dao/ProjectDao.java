package com.kh.tido.project.model.dao;

import java.io.File;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
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

	public ArrayList<Project> selectProjectList(Project project,int begin,int limit) {
		System.out.println(begin);
		RowBounds rowBounds = new RowBounds(begin,limit);
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList",project,rowBounds);
	}

	public int getProjectCount(Project project) {
		return sqlSession.selectOne("projectMapper.getProjectCount",project);
	}

	public int updateProjectTitle(Project project) {
		return sqlSession.update("projectMapper.updateProjectTitle",project);
	}

	public int deleteProject(int pNo) {
		return sqlSession.update("projectMapper.deleteProject",pNo);
	}
	
	
	
}
