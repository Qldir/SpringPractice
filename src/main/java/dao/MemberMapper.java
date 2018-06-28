package dao;

import dto.Member;

public interface MemberMapper {
	public Member login(Member member);
	public int insertMember(Member member);
}
