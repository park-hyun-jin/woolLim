package com.kh.tido.admin.model.service;

import java.util.ArrayList;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.member.model.vo.Member;

public interface AdminUserService {

	ArrayList<Member> memberList();

	int aDeleteMember(ArrayList<String> aMemberList);

	int aReviveMember(ArrayList<String> aMemberList);

	Member aMemberDetail(String id);

	ArrayList<Board> aMemberBoardList(String id);

}
