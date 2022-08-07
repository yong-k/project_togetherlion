package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 마이페이지 HEADER
	@RequestMapping("/mypageheader.lion")
	public String mypageHeader(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		MemberDTO member = dao.mypageHeaderInfo(member_code);
		int point = dao.pointAmount(member_code);
		model.addAttribute("member", member);
		model.addAttribute("point", point);
		return "/WEB-INF/view/user_mypage_header.jsp";
	}
	
	// 마이페이지 MENUBAR
	@RequestMapping("/mypagemenubar.lion")
	public String mypageMenubar()
	{
		return "/WEB-INF/view/user_mypage_menubar.jsp";
	}
	
	// 마이페이지 메인
	@RequestMapping("/mypagemain.lion")
	public String mypageMain(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		if (session.getAttribute("member_code") == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		return "/WEB-INF/view/user_mypageMain.jsp";
	}
	
	// MY 공구
	
	// 게시물 관리
	
	// 찜
	
	// 포인트
	
	// (메뉴바에서 개인정보수정 클릭 시) 비밀번호 확인
	@RequestMapping("/mypage_pwcheck.lion")
	public String mypagePwCheck() 
	{
		return "/WEB-INF/view/user_mypage_myInfo_pwCheck.jsp";
	}
	
}
