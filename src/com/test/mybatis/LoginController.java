package com.test.mybatis;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.util.Naver_Sens_V2;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	// ------------------------------------- 로그인,로그아웃 -------------------------------------
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
	
	// 로그아웃
	@RequestMapping("/logout.lion")
	public String logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.lion";
	}
	// ------------------------------------- 로그인,로그아웃 -------------------------------------
	
	// ---------------------------------------- 회원가입 -----------------------------------------
	// 회원가입폼
	@RequestMapping("/joinform.lion")
	public String joinform() 
	{
		return "/WEB-INF/view/user_joinForm.jsp";
	}
	// 아이디 중복체크
	@RequestMapping("/idcheck.lion")
	public String idCheck(HttpServletRequest request, Model model)
	{
		String ajaxCode = "idCheck";
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		String id = request.getParameter("id");
		int checkId = dao.checkId(id);
		int checkWithdrawId = dao.checkWithdrawId(id);
		model.addAttribute("ajaxCode", ajaxCode);
		model.addAttribute("checkId", checkId);
		model.addAttribute("checkWithdrawId", checkWithdrawId);
		return "/WEB-INF/view/ajax.jsp";
	}
	// 휴대폰번호 중복체크
	@RequestMapping("/telcheck.lion")
	public String telCheck(HttpServletRequest request, Model model)
	{
		String ajaxCode = "telCheck";
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		String tel = request.getParameter("tel");
		int checkTel = dao.checkTel(tel);
		model.addAttribute("ajaxCode", ajaxCode);
		model.addAttribute("checkTel", checkTel);
		return "/WEB-INF/view/ajax.jsp";
	}
	// 휴대폰 인증번호 전송
	@RequestMapping("/telauth.lion")
	public String telAuth(HttpServletRequest request, Model model)
	{
		String ajaxCode = "telAuth";
		try
		{
			request.setCharacterEncoding("UTF-8");
		} 
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		String tel = request.getParameter("tel");
		
		// 6자리 랜덤 숫자 생성 (문자인증)
		Random rand = new Random();
		String smsCode = "";
		for(int i = 0; i < 6; i++)
			smsCode += Integer.toString(rand.nextInt(10));
		
		// 테스트
		System.out.println(tel);
		System.out.println("문자인증코드: " + smsCode);
		
		Naver_Sens_V2 api = new Naver_Sens_V2();
		api.send_msg(tel, smsCode);
		
		HttpSession session = request.getSession();
		session.setAttribute("smsCode", smsCode);
		model.addAttribute("smsCode", smsCode);
		model.addAttribute("ajaxCode", ajaxCode);
		return "/WEB-INF/view/ajax.jsp";
	}
	// 휴대폰 인증번호 확인
	@RequestMapping("/telauthcheck.lion")
	public String telAuthCheck(HttpServletRequest request, Model model)
	{
		String ajaxCode = "telAuthCheck";
		try
		{
			request.setCharacterEncoding("UTF-8");
		} 
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String smsCode = (String)session.getAttribute("smsCode");
		String telCheckNum = request.getParameter("telCheckNum");
		
		if (smsCode.equals(telCheckNum))
			model.addAttribute("result", false);
		else
			model.addAttribute("result", true);
		
		model.addAttribute("ajaxCode", ajaxCode);
		return "/WEB-INF/view/ajax.jsp";
	}
	
	// 닉네임 중복체크
	@RequestMapping("/nicknamecheck.lion")
	public String nicknameCheck(HttpServletRequest request, Model model)
	{
		String ajaxCode = "nicknameCheck";
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		String nickname = request.getParameter("nickname");
		int checkNickname = dao.checkNickname(nickname);
		model.addAttribute("ajaxCode", ajaxCode);
		model.addAttribute("checkNickname", checkNickname);
		return "/WEB-INF/view/ajax.jsp";
	}
	// 회원가입
	@RequestMapping("/joininsert.lion")
	public String joinInsert(HttpServletRequest request, MemberDTO member, Model model)
	{
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		dao.insertMember(member);
		int joinCheck = dao.checkId(member.getId());
		HttpSession session = request.getSession();
		session.removeAttribute("smsCode");
		model.addAttribute("joinCheck", joinCheck);
		return "redirect:joinform.lion";
	}
	// ---------------------------------------- 회원가입 -----------------------------------------
	
	// --------------------------------------- ID/PW 찾기 ----------------------------------------
	// ID 찾기 입력폼
	@RequestMapping("/findidform.lion")
	public String findIdForm() 
	{
		return "/WEB-INF/view/user_findIdForm.jsp";
	}
	// ID 찾기
	@RequestMapping("/findid.lion")
	public String findId(MemberDTO dto, Model model)
	{
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		MemberDTO member = dao.findId(dto);
		if (member == null)
		{
			boolean errCode = true;
			model.addAttribute("errCode", errCode);
			return "redirect:findidform.lion";
		}
		model.addAttribute("id", member.getId());
		model.addAttribute("regist_datetime", member.getRegist_datetime());
		return "/WEB-INF/view/user_findId_success.jsp";
	}
	
	// PW 찾기 입력폼
	@RequestMapping("/findpwform.lion")
	public String findPwForm() 
	{
		return "/WEB-INF/view/user_findPwForm.jsp";
	}
	// PW 찾기
	@RequestMapping("/findpw.lion")
	public String findPw(MemberDTO dto, Model model)
	{
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		int result = dao.findPw(dto);
		if (result < 1)
		{
			boolean errCode = true;
			model.addAttribute("errCode", errCode);
			return "redirect:findpwform.lion";
		}
		model.addAttribute("id",dto.getId());
		return "/WEB-INF/view/user_findPw_updateForm.jsp";
	}
	// PW 찾기 - 변경폼
	@RequestMapping("/updatepw.lion")
	public String updatePw(MemberDTO member, Model model)
	{
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		dao.updatePw(member);
		model.addAttribute("code", true);
		return "redirect:loginform.lion";
	}
	// --------------------------------------- ID/PW 찾기 ----------------------------------------
}

