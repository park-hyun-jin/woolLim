package com.kh.tido.visitor.model.service;

import com.kh.tido.visitor.model.vo.VisitorCount;

public interface VisitorService {

	/** 방문자 입력
	 * @param vc
	 * @return
	 */
	int insertVisitor(VisitorCount vc);

	/** 방문자 수 받아오기
	 * @return
	 */
	String selectVisitor();

	String projectCount();

	String boardCount();

	String memberCount();

}
