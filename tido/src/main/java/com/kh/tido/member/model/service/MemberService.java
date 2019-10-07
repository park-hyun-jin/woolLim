package com.kh.tido.member.model.service;

import com.kh.tido.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member mem);

	void create(Member mem) throws Exception;

	void userAuth(String memberId, String memberAuthKey) throws Exception;

}
