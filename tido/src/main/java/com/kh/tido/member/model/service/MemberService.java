package com.kh.tido.member.model.service;

import com.kh.tido.member.model.vo.Member;
import com.kh.tido.member.model.vo.MemberAuth;

public interface MemberService {

	Member loginMember(Member mem);

	void insertAuth(String email) throws Exception;

	int updateAuth(MemberAuth memberAuth) throws Exception;

	int insertMember(Member mem);

	int selectId(String memberId);

}
