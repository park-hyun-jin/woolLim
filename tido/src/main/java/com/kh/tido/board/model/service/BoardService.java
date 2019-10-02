package com.kh.tido.board.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Reply;

public interface BoardService {

	public abstract ArrayList<Board> selectList(int currentPage);
	
	public abstract int insertBoard(Board board, MultipartFile uploadFile, HttpServletRequest request);
	
	public abstract Board selectBoard(int bNo);
	
	public abstract int deleteBoard(int bNo);
	
	public abstract int updateBoard(Board board, MultipartFile reloadFile, HttpServletRequest request);
	
	public abstract int insertReply(Reply reply);
	
	public abstract ArrayList<Reply> selectReply(int bId);
}
