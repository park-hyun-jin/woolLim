package com.kh.tido.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Reply;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.member.model.vo.MemberAuth;

public interface MemberService {

	Member loginMember(Member mem);

	void insertAuth(String email) throws Exception;

	int updateAuth(MemberAuth memberAuth) throws Exception;

	int insertMember(Member mem, MultipartFile uploadFile, HttpServletRequest request);

	int selectId(String memberId);

	int selectName(String name);

	ArrayList<Board> selectMemberBoard(String id, int currentPage);

	ArrayList<Board> selectMemberBoardSearch(String id, int currentPage, String search, String sort);

	ArrayList<Reply> selectMemberReply(String id, int currentPage);
	
	ArrayList<Reply> selectMemberReplySearch(String id, int currentPage, String search, String sort);


}
