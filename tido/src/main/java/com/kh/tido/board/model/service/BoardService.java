package com.kh.tido.board.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Reply;
import com.kh.tido.board.model.vo.Search;

public interface BoardService {

	public abstract ArrayList<Board> selectList(int currentPage);
	
	public abstract ArrayList<Board> selectListN(int currentPage);

	public abstract ArrayList<Board> selectListAll(int currentPage);
	
	public abstract int insertBoard(Board board, MultipartFile uploadFile, HttpServletRequest request);
	
	public abstract Board selectBoard(int bNo);
	
	public abstract int deleteBoard(int bNo);
	
	public abstract int updateBoard(Board board, MultipartFile reloadFile, HttpServletRequest request);
	
	public abstract int insertReply(Reply reply);
	
	public abstract ArrayList<Reply> selectReply(int bId);

	public abstract int deleteBoard(ArrayList<Integer> deleteList);
	
	public abstract int reviveBoard(ArrayList<Integer> reviveList);

	public abstract ArrayList<Board> searchList(Search search);

	


}
