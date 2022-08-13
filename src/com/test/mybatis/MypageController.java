package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		// member_code(세션값) 확인
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
	
	// ------------------------------------- 회원정보수정 -------------------------------------
	// (메뉴바에서 개인정보수정 클릭 시) 비밀번호 입력폼
	@RequestMapping("/mypage_pwcheckform.lion")
	public String mypagePwCheckForm(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		if (session.getAttribute("member_code") == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		return "/WEB-INF/view/user_mypage_myInfo_pwCheck.jsp";
	}
	
	// 비밀번호 확인
	@RequestMapping(value="/mypage_pwcheck.lion", method=RequestMethod.POST)
	public String mypagePwCheck(MemberDTO member, HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		if (session.getAttribute("member_code") == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		int result = dao.pwCheck(member);
		
		if (result > 0)
			return "redirect:mypage_myinfoupdateform.lion";
		else
		{
			model.addAttribute("errCase", true);
			return "redirect:mypage_pwcheckform.lion";
		}
	}
	
	// 개인정보수정폼
	@RequestMapping(value="/mypage_myinfoupdateform.lion")
	public String myInfoUpdateForm(Model model, HttpServletRequest request)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		MemberDTO member = dao.memberInfo(member_code);
		model.addAttribute("member", member);
		return "/WEB-INF/view/user_mypage_myInfo.jsp";
	}
	
	// 개인정보수정
	@RequestMapping(value="/mypage_myinfoupdate.lion", method=RequestMethod.POST)
	public String myInfoUpdate(MemberDTO member, Model model, HttpServletRequest request)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		
		// 입력한 현재 비밀번호 == 현재 비밀번호 확인
		String nowPwCheck = dao.nowPwCheck(member_code);
		String nowPw = request.getParameter("nowPw");
		if (!nowPwCheck.equals(nowPw))
			model.addAttribute("errCase", true);
		else
		{
			if (member.getPw() == "") 
				member.setPw(nowPwCheck);
			dao.updateMemberInfo(member);
			model.addAttribute("update", "ok");
		}
		return "redirect:mypage_myinfoupdateform.lion";
	}
	// ------------------------------------- 회원정보수정 -------------------------------------	
}
