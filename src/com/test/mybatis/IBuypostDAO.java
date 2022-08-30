package com.test.mybatis;

import java.util.ArrayList;

import com.test.util.Search_buypost;

public interface IBuypostDAO
{
	// 대분류(코드, 이름)
	public ArrayList<MainCategoryDTO> mainCateList();
	
	// 공동구매 목록
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
	//--▷ 최근공구
	public ArrayList<BuypostDTO> buypostList_new();
	//--▷ 마감임박
	public ArrayList<BuypostDTO> buypostList_final();
	//--▷ 검색
	public ArrayList<BuypostDTO> buypostList_search();
	
}
