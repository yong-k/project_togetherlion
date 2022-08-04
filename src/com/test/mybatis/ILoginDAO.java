package com.test.mybatis;

public interface ILoginDAO
{
	// ★매개변수 2개 이상이면 DTO로 받기! 아니면 hashmap 구성해야함
	
	/* 로그인 */
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
	
	
	/* 회원가입 */
	// 아이디 중복체크 (회원정보테이블)
	public int checkId(String id);
	// 아이디 중복체크 (탈퇴테이블)
	public int checkWithdrawId(String id);
	// 휴대폰번호 중복체크
	public int checkTel(String tel);
	// 닉네임 중복체크
	public int checkNickname(String nickname); 
	// 회원가입INSERT
	public void insertMember(MemberDTO dto);
	
	
	/* ID,PW 찾기 */
	// ID 찾기
	public String findId(MemberDTO dto);
	// PW 찾기
	public String findPw(MemberDTO dto);
	
}
