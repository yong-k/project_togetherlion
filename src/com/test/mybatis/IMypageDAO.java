package com.test.mybatis;

public interface IMypageDAO
{
	// 회원정보(프사,닉네임,매너지수)
	public MemberDTO mypageHeaderInfo(String member_code);
	
	// 포인트 총액
	public int pointAmount(String member_code); 
	
	
	/* 회원정보수정 */
	// 비밀번호 확인 (MemberDTO 사용 → 일치하는 정보 있는지 count)
	public int pwCheck(MemberDTO dto);
	// 개인정보수정폼
	public MemberDTO memberInfo(String member_code);
	// 현재 비밀번호 확인 (member_code만 사용 → 비밀번호 return)
	public String nowPwCheck(String member_code);
	// 개인정보수정
	public void updateMemberInfo(MemberDTO dto);
}
