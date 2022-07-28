package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인폼
	@RequestMapping("/loginform.lion")
	public String loginform() 
	{
		return "/WEB-INF/view/user_loginForm.jsp";
	}
	
	// 회원 로그인
	/*
	> 데이터 있으면, 멤버코드 세션에 심어두고, 메인으로 이동
	> 데이터 없으면 로그인폼으로
	*/
	@RequestMapping(value="/loginmember.lion", method=RequestMethod.POST)
	public String loginMember(HttpServletRequest request, MemberDTO dto) {
		String result = null;
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		String member_code = dao.loginMember(dto);
		System.out.println(member_code);
		
		/*
		if (member_code != null)
		{
			result = "/main.lion";
			System.out.println("널아님");
		}
		else
			result = "redirect:loginform.lion";
		*/
		
		return result;
	}
	
	// 관리자 로그인
	/*
	> 데이터 있으면, 멤버코드 세션에 심어두고, 관리자메인으로 이동
	> 데이터 없으면 로그인폼으로
	*/
	@RequestMapping("/loginadmin.lion")
	public String loginAdmin() 
	{
		String result = null;
		return result;
	}
	
	
	// ID찾기
	@RequestMapping("/findidform.lion")
	public String findidform() 
	{
		return "/WEB-INF/view/user_findIdForm.jsp";
	}
	
	// PW찾기
	@RequestMapping("/findpwform.lion")
	public String findpwform() 
	{
		return "/WEB-INF/view/user_findPwForm.jsp";
	}
	
	// 회원가입폼
	@RequestMapping("/joinform.lion")
	public String joinform() 
	{
		return "/WEB-INF/view/user_joinForm.jsp";
	}
	
	// 회원가입
	
	// 로그아웃
	
}

