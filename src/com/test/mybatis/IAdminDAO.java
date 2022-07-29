package com.test.mybatis;

public interface IAdminDAO
{
	// 관리자 찾기 (세션에 있는 멤버코드로)
	public AdminDTO searchAdmin(String member_code);
}
