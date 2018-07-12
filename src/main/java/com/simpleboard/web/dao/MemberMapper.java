package com.simpleboard.web.dao;

import com.simpleboard.web.dto.Member;

public interface MemberMapper {
	public Member login(Member member);
	public int idcheck(Member member);
	public int insertMember(Member member);
}
