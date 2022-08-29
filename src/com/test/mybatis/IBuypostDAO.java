package com.test.mybatis;

import java.util.ArrayList;

public interface IBuypostDAO
{
	// 대분류(코드, 이름)
	public ArrayList<MainCategoryDTO> mainCateList();
	
	// 공동구매 목록
	//--▷메인(32개) 
	public ArrayList<BuypostDTO> buypostList_main(String user_region);
	//--▷ 메인카테고리
	public ArrayList<BuypostDTO> buypostList_mainCate();
	//--▷ 서브카테고리
	public ArrayList<BuypostDTO> buypostList_subCate();
	//--▷ 최근공구
	public ArrayList<BuypostDTO> buypostList_new();
	//--▷ 마감임박
	public ArrayList<BuypostDTO> buypostList_final();
	//--▷ 검색
	public ArrayList<BuypostDTO> buypostList_search();
	
}
