package com.test.mybatis;

import java.util.ArrayList;

public interface IAdminDAO
{
	// 관리자 찾기 (세션에 있는 멤버코드로)
	public AdminDTO searchAdmin(String member_code);
	
	
	
	// 홈페이지관리
	//--> 매너지수목록
	public ArrayList<MannerLevelDTO> mannerList();
	
	
}
