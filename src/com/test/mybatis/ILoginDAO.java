package com.test.mybatis;

public interface ILoginDAO
{
	// ★매개변수 2개 이상이면 DTO로 받기! 아니면 hashmap 구성해야함
	// 회원 로그인
	//public String loginMember(String id, String pw);
	public String loginMember(MemberDTO dto);
	
	// 관리자 로그인
	//public String loginAdmin(String id, String pw);
	public String loginAdmin(AdminDTO dto);
}
