package com.kh.tido.board.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Reply;
import com.kh.tido.board.model.vo.Search;

public interface BoardService {

	
	public abstract int insertBoard(Board board, MultipartFile uploadFile, HttpServletRequest request);
	

	public abstract ArrayList<Board> selectList(int currentPage);
	
	public abstract Board selectBoard(int cBoardNo);
		
	public abstract int deleteBoard(int cBoardNo);

	
	public abstract int updateBoard(Board board, MultipartFile reloadFile, HttpServletRequest request);
	
	public abstract int insertReply(Reply reply);
	

	public abstract ArrayList<Reply> selectReply(int cBoardNo);

	


}
