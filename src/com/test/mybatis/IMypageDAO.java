package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.util.Search_buypost;

public interface IMypageDAO
{
	// 회원정보(프사,닉네임,매너지수)
	public MemberDTO mypageHeaderInfo(String member_code);
	
	// 포인트 총액
	public String pointAmount(String member_code); 
	
	
	/* MY 공구 */
	/* 게시물관리 */
	
	
	
	/* 찜 */
	// 찜한 게시물 있는지 확인
	public int hasWishlist(String member_code);
	// 찜 목록 개수
	public int count_wishlist(String member_code);
	// 찜 목록
	public ArrayList<BuypostDTO> wishlist(Search_buypost search) throws Exception;
	// 찜 삭제
	public void deleteWishlist(String wish_code);
	
	
	/* 포인트 */
	// 사용내역 <회원코드, 검색값>
	public ArrayList<PointDTO> pointList(HashMap<String, String> params);
	
	//---------------------------계좌등록팝업---------------------------
	// 은행목록
	public ArrayList<BankDTO> bankList();
	// 대표계좌 소유 확인
	public int hasMainAccount(String member_code);
	// 계좌등록 _ ① 대표계좌 있는 경우 → 계좌테이블 INSERT
	public void accountInsert(AccountDTO dto);
	// 계좌등록 _ ② 대표계좌 없는 경우 → 계좌테이블 + 대표계좌테이블 INSERT
	public void mainAccountInsert(AccountDTO dto);
	
	//---------------------------계좌관리팝업---------------------------
	// 계좌목록
	public ArrayList<AccountDTO> accountList(String member_code);
	// 대표계좌설정 <계좌코드, 회원코드>
	public void updateMainAccount(HashMap<String, String> params);
	// 대표계좌 여부 확인
	public int isMainAccount(String account_code);
	// 계좌삭제
	public void deleteAccount(String account_code);
	
	//--------------------------포인트충전팝업--------------------------
	// 포인트 충전
	public void chargePoint(PointDTO dto);
	
	//--------------------------포인트인출팝업--------------------------
	// 포인트 인출
	public void withdrawPoint(PointDTO dto);
	
	
	
	/* 개인정보수정 */
	// 비밀번호 확인 (MemberDTO 사용 → 일치하는 정보 있는지 count)
	public int pwCheck(MemberDTO dto);
	// 개인정보수정폼
	public MemberDTO memberInfo(String member_code);
	// 현재 비밀번호 확인 (member_code만 사용 → 비밀번호 return)
	public String nowPwCheck(String member_code);
	// 개인정보수정
	public void updateMemberInfo(MemberDTO dto);
	// 회원탈퇴
	public void memberWithdraw(String member_code);
	
}
