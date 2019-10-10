package com.kh.tido.board.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.board.model.dao.BoardDao;
import com.kh.tido.board.model.exception.BoardException;
import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.board.model.vo.Reply;
import com.kh.tido.common.Pagination;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;
	
	@Override
	public ArrayList<Board> selectList(int currentPage){
		
		int listCount = bDao.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return bDao.selectList(pi);
	}

	@Override
	public int insertBoard(Board board, MultipartFile uploadFile, HttpServletRequest request) {
		
		board.setcBoardContent(board.getcBoardContent().replace("\n", "<br>"));
		String cBoardChaFilename = null;
		
// 수정할 수 있음
		if(!uploadFile.getOriginalFilename().equals("")) {
			cBoardChaFilename = renameFile(uploadFile);
			
			board.setcBoardOriFilename(uploadFile.getOriginalFilename());
			board.setcBoardChaFilename(cBoardChaFilename);
		}
		int result = bDao.insertBoard(board);
		if(cBoardChaFilename != null && result == 1) {
			result = saveFile(cBoardChaFilename, uploadFile, request);
		}
		return result;
	}

	private String renameFile(MultipartFile file) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String cBoardOriFilename = file.getOriginalFilename();
		String cBoardChaFilename = sdf.format(new Date()) + "."
									+ cBoardOriFilename.substring(cBoardOriFilename.lastIndexOf(".")+1);
		return cBoardChaFilename;
	}

	private int saveFile(String cBoardChaFilename, MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filePath = folder + "\\" + cBoardChaFilename;
		int result = 0;
		try {
			uploadFile.transferTo(new File(filePath));
			result = 1;
		} catch (Exception e) {
			System.out.println("파일전송에러 : " + e.getMessage());
			throw new BoardException("파일 전송 에러");
		}
		return result;
	}


	@Override
	public Board selectBoard(int cBoardNo) {
		bDao.addReadCount(cBoardNo);
		Board board = bDao.selectBoard(cBoardNo);
		return board;
	}

	@Override
	public int deleteBoard(int cBoardNo) {
		
		return bDao.deleteBoard(cBoardNo);
	}

	@Override
	public int updateBoard(Board board, MultipartFile reloadFile, HttpServletRequest request) {
		board.setcBoardContent(board.getcBoardContent().replace("\n", "<br>"));
		String cBoardOriFilename = null;
		String cBoardChaFilename = null;
		if(!reloadFile.getOriginalFilename().equals("")) {
			cBoardOriFilename = board.getcBoardChaFilename();
			cBoardChaFilename = renameFile(reloadFile);
			
			board.setcBoardOriFilename(reloadFile.getOriginalFilename());
			board.setcBoardChaFilename(cBoardChaFilename);
		}
		int result = bDao.updateBoard(board);
		if(cBoardChaFilename != null && result == 1) {
			result += saveFile(cBoardChaFilename, reloadFile, request);
		}
		if(result == 2) {
			deleteFile(cBoardOriFilename, request);
		}
		return result;
	}

	

	private void deleteFile(String cBoardOriFilename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFile";
		File deleteFile = new File(savePath + "\\" + cBoardOriFilename);
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	@Override
	public int insertReply(Reply reply) {
		reply.setCbReplyContent(reply.getCbReplyContent().replace("\n", "<br>"));
		return bDao.insertReply(reply);
	}

	@Override
	public ArrayList<Reply> selectReply(int cBoardNo) {
		return bDao.selectReply(cBoardNo);
	}

}
