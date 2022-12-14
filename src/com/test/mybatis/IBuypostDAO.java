package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

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
	public BuypostDTO buypostArticle(String buypost_code);
	//--▷ 참여자 목록
	public ArrayList<MemberDTO> participant_info(String buypost_code);

	//----[[ 댓글 ]]
	//--▷ 고정 댓글 코드
	public String fixReplyCode(String buypost_code);
	//--▷ 댓글 목록
	public ArrayList<BuypostReplyDTO> replyList(String buypost_code);
	//--▷ 댓글 등록
	public void insertReply(BuypostReplyDTO dto);
	//--▷ 댓글 수정
	public void updateReply(BuypostReplyDTO dto);
	//--▷ 댓글 삭제
	public void deleteReply(String reply_code);
	//--▷ 댓글 고정하기
	public void fixReply(String reply_code);
	//--▷ 댓글 고정취소
	public void noFixReply(String buypost_code);
	
	//----[[ 신고 ]]
	//--신고 팝업 
	//--▷ (공통) 메인 카테고리
	public ArrayList<ReportMainCategoryDTO> reportMaincateList();
	//--▷ (공통) 서브 카테고리
	public ArrayList<ReportSubCategoryDTO> reportSubcateList();
	//--▷ 게시물 신고 팝업 (작성자, 제목)
	public BuypostReportDTO reportBuypost(String buypost_code);
	//--▷ 댓글 신고 팝업   (작성자, 내용)
	public BuypostReplyReportDTO reportBuypostReply(String reply_code);
	
	//--신고 접수
	//--▷ 블라인드 게시물인지 확인
	public int isBlindBuypost(String buypost_code);
	//--▷ 게시물 신고 접수
	public void insertReportBuypost(HashMap<String, String> params);
	//--▷ 블라인드 댓글인지 확인
	public int isBlindBuypostReply(String reply_code);
	//--▷ 댓글 신고 접수 
	public void insertReportBuypostReply(HashMap<String, String> params);

	//--찜
	//--▷ 회원의 해당 게시물 찜 여부
	public int isWishlist(HashMap<String, String> params);
	//--▷ 찜 등록
	public void insertWishlist(HashMap<String, String> params);
	//--▷ 찜 해제
	public void deleteWishlist(HashMap<String, String> params);
	
	//--▷ 공동구매 상태(모집,진행,완료,모집실패,취소)
	public String buypostStatus(String buypost_code);
	//--▷ 회원의 진행자/미참여자/참여자 여부
	public String memberInBuypostStatus(HashMap<String, String> params);

	// 버튼
	//--▷ <참여하기>
	// 참여팝업: 회원 보유 포인트
	public String pointAmount(String member_code);
	// 공동구매 참여
	public void insertParticipant(ParticipantDTO participant);
	
	//--▷ <추가참여>
	public void updateParticipant(ParticipantDTO participant);
	
	//--▷ <참여취소>
	public void deleteParticipant(HashMap<String, String> params);
	
	//--▷ <진행취소>, 모집실패, 신고승인취소 게시물
	public void cancleBuypost(String buypost_code);
	
	// ------------------------------------------------------------------ 공동구매 게시물 상세보기
	
	// 공동구매 게시물 작성폼 --------------------------------------------------------------------
	//--▷ 대분류에 맞는 소분류 목록
	public ArrayList<SubCategoryDTO> subCateList(String main_cate_code);
	
	//--▷ 공동구매 게시물 INSERT
	public void insertBuypost(BuypostDTO buypost);
	
	//--▷ 회원이 가장 최근에 쓴 공동구매 게시물 코드(INSERT 후, 게시물 상세보기)
	public String showInsertBuypost(HashMap<String, String> params);

	// -------------------------------------------------------------------- 공동구매 게시물 작성폼
	 
}
