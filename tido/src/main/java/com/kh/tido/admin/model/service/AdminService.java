package com.kh.tido.admin.model.service;

import java.util.ArrayList;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.notice.model.vo.Notice;

public interface AdminService {

	public abstract ArrayList<Board> selectList(int currentPage);
	
	public abstract ArrayList<Board> selectListN(int currentPage);

	public abstract ArrayList<Board> selectListAll(int currentPage);
	
	public abstract int deleteBoard(ArrayList<Integer> deleteList);
	
	public abstract int reviveBoard(ArrayList<Integer> reviveList);

	public abstract ArrayList<Board> searchList(Search search);
	
	
	public abstract ArrayList<Notice> noticeSearchList(Search search);

	public abstract int noticeDeleteBoard(ArrayList<Integer> deleteList);

	public abstract int reviveNBoard(ArrayList<Integer> reviveList);
	
	public abstract ArrayList<Notice> noticeSelectList(int currentPage);

	public abstract ArrayList<Notice> noticeSelectListN(int currentPage);
	
	public abstract ArrayList<Notice> noticeSelectListAll(int currentPage);
	
	
}
