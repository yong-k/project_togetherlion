package com.test.mybatis;

import java.util.ArrayList;

public interface IAdminDAO
{
	// 관리자 찾기 (세션에 있는 멤버코드로)
	public AdminDTO searchAdmin(String member_code);
	
	
	
	// 홈페이지관리
	//--▷ 공지사항
	//--▷ 카테고리 목록(대분류/소분류)
	public ArrayList<MainCategoryDTO> mainCateList();
	public ArrayList<SubCategoryDTO> subCateList();
	//--> 매너지수 목록
	public ArrayList<MannerLevelDTO> mannerList();
	
	
	// 신고관리
	//--▷ 접수내역
	//--▷ 처리내역
	//--▷ 사유관리
	public ArrayList<ReportMainCategoryDTO> reportMainCateList();
	public ArrayList<ReportSubCategoryDTO> reportSubCateList();
	
	
	// 문의관리
	//--▷
	
	
	// 관리자계정관리
	//--▷ 목록
	public ArrayList<AdminDTO> adminList();
	//--▷ 계정 개수 확인
	public int adminCount();
	//--▷ 아이디 중복확인
	public int checkId(String id);
	//--▷ 휴대폰번호 중복확인
	public int checkTel(String tel);
	//--▷ 계정생성
	public void insertAdmin(AdminDTO dto);
	//--▷ 계정수정폼
	public AdminDTO adminInfo(String id);
	//--▷ 비밀번호 확인
	public String pwCheck(String id);
	//--▷ 계정수정
	public void updateAdmin(AdminDTO dto);
	//--▷ 계정삭제
	public void deleteAdmin(String id); 
}
