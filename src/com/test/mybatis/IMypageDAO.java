package com.test.mybatis;

public interface IMypageDAO
{
	// 회원정보(프사,닉네임,매너지수)
	public MemberDTO mypageHeaderInfo(String member_code);
	
	// 포인트 총액
	public int pointAmount(String member_code); 
}
