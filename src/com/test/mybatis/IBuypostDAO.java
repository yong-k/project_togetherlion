package com.test.mybatis;

import java.util.ArrayList;

public interface IBuypostDAO
{
	// 대분류(코드, 이름)
	public ArrayList<mainCategoryDTO> mainCateList();
}
