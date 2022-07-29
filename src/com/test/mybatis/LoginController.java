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
	@RequestMapping(value="/loginmember.lion", method=RequestMethod.POST)
	public String loginMember(Model model, HttpServletRequest request, MemberDTO member) {
		String result = null;
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		String member_code = dao.loginMember(member);
		
		if (member_code != null)
		{
			// 멤버코드 값 있으면, 영구정지 여부 확인
			if (dao.checkBanMember(member_code) > 0)
			{
				// 1-1) errCase1 → 로그인폼에서 정지 알림띄우기
				// 영구정지 신고 건이 게시물인지 댓글인지 확인
				String banType = null;
				String banReason_article = dao.banReason_article(member_code);
				if (banReason_article == null)
				{
					banType = "reply";
					String banReason_reply = dao.banReason_reply(member_code);
					model.addAttribute("banReason", banReason_reply);
				}
				else
				{	
					banType = "article";
					model.addAttribute("banReason", banReason_article);
				}
				
				model.addAttribute("errCase", 1);
				model.addAttribute("banType", banType);
				result = "redirect:/loginform.lion";
			}
			else
			{
				// 2) 멤버코드 세션에 심어두고, 메인으로 이동
				HttpSession session = request.getSession();
				session.setAttribute("member_code", member_code);
				result = "/main.lion";
			}
		}
		else
		{
			// errCase2 → 멤버코드 값 null이면 로그인폼으로 
			model.addAttribute("errCase", 2);
			result = "redirect:loginform.lion";
		}
		
		return result;
	}
	
	// 관리자 로그인
	@RequestMapping("/loginadmin.lion")
	public String loginAdmin(Model model, HttpServletRequest request, AdminDTO admin) 
	{
		String result = null;
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		String member_code = dao.loginAdmin(admin);
		
		if (member_code != null)
		{
			// 멤버코드 값 있으면, 멤버코드 세션에 심어두고, 관리자 메인으로 이동
			HttpSession session = request.getSession();
			session.setAttribute("member_code", member_code);
			result = "/admin.lion";
			
		}
		else
		{
			// 멤버코드 값 null이면 로그인폼으로
			model.addAttribute("errCase", 2);
			result = "redirect:loginform.lion";
		}
		
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
	@RequestMapping("/logout.lion")
	public String logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.lion";
	}
	
}

