package com.test.mybatis;

public interface IMemberDAO
{
	// 회원 찾기 (세션에 있는 멤버코드로)
	public MemberDTO searchMember(String member_code);
}
