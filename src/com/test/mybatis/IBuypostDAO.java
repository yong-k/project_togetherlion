package com.test.mybatis;

import java.util.ArrayList;

import com.test.util.Search_buypost;

public interface IBuypostDAO
{
	// 대분류(코드, 이름)
	public ArrayList<MainCategoryDTO> mainCateList();
	
	// 공동구매 목록 -----------------------------------------------------------------------------
	 
	//--▷메인(32개) 
	public ArrayList<BuypostDTO> buypostList_main(String user_region);
	//--▷ 서브카테고리로 메인카테고리 찾기
	public String searchMainCate(String sub_cate_code);
	//--▷ 메인카테고리 & 서브카테고리 이름 
	public ArrayList<SubCategoryDTO> categoryList(String main_cate_code);
	//--▷ 카테고리 목록 개수
	public int count_category(Search_buypost search) throws Exception;
	//--▷ 카테고리
	public ArrayList<BuypostDTO> buypostList_category(Search_buypost search) throws Exception;
	//--▷ 최근공구 목록 개수
	public int count_new(Search_buypost search) throws Exception;
	//--▷ 최근공구
	public ArrayList<BuypostDTO> buypostList_new(Search_buypost search) throws Exception;
	//--▷ 마감임박 목록 개수
	public int count_final(Search_buypost search) throws Exception;
	//--▷ 마감임박
	public ArrayList<BuypostDTO> buypostList_final(Search_buypost search) throws Exception;
	//--▷ 검색 목록 개수
	public int count_search(Search_buypost search) throws Exception;
	//--▷ 검색
	public ArrayList<BuypostDTO> buypostList_search(Search_buypost search) throws Exception;
	
	// ----------------------------------------------------------------------------- 공동구매 목록 
	
	// 공동구매 게시물 상세보기 ------------------------------------------------------------------
	
	// 공동구매 게시물 내용
	//--▷ 상세보기
	public BuypostDTO buypostArticle(String code);
	//--▷ 참여자 목록
	public ArrayList<MemberDTO> participant_info(String code);
	//--▷ 댓글목록
	//--▷ 회원의 진행자/미참여자/참여자 여부
	//--▷ 공동구매 상태(모집,진행,완료,모집실패,취소)
	
	// 찜
	//--▷ 찜 추가
	
	// 댓글
	//--▷ 댓글 등록
	//--▷ 댓글 수정
	//--▷ 댓글 삭제
	//--▷ 댓글 고정
	//--▷ 댓글 고정 취소
	//--▷ 신고 팝업 (메인카테이름,서브카테이름)
	
	// 신고
	//--▷ 게시물 신고
	//--▷ 댓글 신고
	
	// 버튼
	//--▷ <참여하기>
	//--▷ <추가참여>
	//--▷ <참여취소>
	//--▷ <진행취소>, 모집실패, 신고승인취소 게시물
	
	// ------------------------------------------------------------------ 공동구매 게시물 상세보기
	 
}
