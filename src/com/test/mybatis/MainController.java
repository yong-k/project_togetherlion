package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	// header
	@RequestMapping("/header.lion")
	public String header() {
		return "/WEB-INF/view/user_header.jsp";
	}
	
	// footer
	@RequestMapping("/footer.lion")
	public String footer() {
		return "/WEB-INF/view/user_footer.jsp";
	}
	
	// 메인
	@RequestMapping("/main.lion")
	public String main() {
		return "/WEB-INF/view/user_main.jsp";
	}
	
	
}
