package com.test.util;

public class Search_buypost extends Pagination
{
	private String user_region, main_cate_code, sub_cate_code, member_code;
	private String searchType;

	public String getUser_region()
	{
		return user_region;
	}

	public void setUser_region(String user_region)
	{
		this.user_region = user_region;
	}

	public String getMain_cate_code()
	{
		return main_cate_code;
	}

	public void setMain_cate_code(String main_cate_code)
	{
		this.main_cate_code = main_cate_code;
	}

	public String getSub_cate_code()
	{
		return sub_cate_code;
	}

	public void setSub_cate_code(String sub_cate_code)
	{
		this.sub_cate_code = sub_cate_code;
	}
	
	public String getMember_code()
	{
		return member_code;
	}

	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}

	public String getSearchType()
	{
		return searchType;
	}

	public void setSearchType(String searchType)
	{
		this.searchType = searchType;
	}
	
}
