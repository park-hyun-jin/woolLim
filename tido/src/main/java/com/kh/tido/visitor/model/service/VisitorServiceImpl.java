package com.kh.tido.visitor.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.visitor.model.dao.VisitorDao;
import com.kh.tido.visitor.model.vo.VisitorCount;

@Service("vService")
public class VisitorServiceImpl implements VisitorService{

	@Autowired
	private VisitorDao vDao;
	
	@Override
	public int insertVisitor(VisitorCount vc) {
		int result = 0;
		int check = vDao.checkVisitor(vc);
		if(check==0) {
			result = vDao.insertVisitor(vc);
		}		
		
		return result;
	}

	@Override
	public String selectVisitor() {
		return vDao.selectVisitor();
	}

}
