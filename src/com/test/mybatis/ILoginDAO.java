package com.test.mybatis;

public interface ILoginDAO
{
	// ★매개변수 2개 이상이면 DTO로 받기! 아니면 hashmap 구성해야함
	// 회원 로그인
	//public String loginMember(String id, String pw);
	public String loginMember(MemberDTO dto);
	
	// 영구정지 여부 확인
	public int checkBanMember(String member_code);
	
	// 영구정지 사유 
	// ①공동구매 게시물 확인
	public String banReason_article(String member_code);
	// ②공동구매 댓글 확인
	public String banReason_reply(String member_code);
	
	// 관리자 로그인
	//public String loginAdmin(String id, String pw);
	public String loginAdmin(AdminDTO dto);
}
