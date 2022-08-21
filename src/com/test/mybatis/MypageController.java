package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	// ---------------------------------------- 포인트 ----------------------------------------
	// 포인트
	@RequestMapping("/mypage_point.lion")
	public String mypagePointMain(HttpServletRequest request, Model model)
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
		MemberDTO member = dao.mypageHeaderInfo(member_code);
		int point = dao.pointAmount(member_code);
		HashMap<String, String> params = new HashMap<String, String>();
		String type = request.getParameter("type");
		if (type == null || type.equals("%")) type = "%";
		params.put("member_code", member_code);
		params.put("type", type);
		ArrayList<PointDTO> pointList = dao.pointList(params);
		model.addAttribute("member", member);
		model.addAttribute("point", point);
		model.addAttribute("pointList", pointList);
		
		return "/WEB-INF/view/user_mypage_point.jsp";
	}
	
	// 계좌등록팝업
	@RequestMapping("/point_accountinsertform.lion")
	public String pointAccountInsertForm(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		if (session.getAttribute("member_code") == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}		
		
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		ArrayList<BankDTO> bankList = dao.bankList();
		model.addAttribute("bankList", bankList);
		
		return "/WEB-INF/view/user_mypage_point_accountInsertForm_popup.jsp";
	}
	// 계좌등록
	@RequestMapping("/point_accountinsert.lion")
	public String pointAccountInsert(HttpServletRequest request, Model model, AccountDTO account)
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
		int hasMainAccount = dao.hasMainAccount(member_code);
		account.setMember_code(member_code);
		if (hasMainAccount > 0)
			dao.accountInsert(account);
		else
			dao.mainAccountInsert(account);
		
		model.addAttribute("code", true);
		return "redirect:point_accountinsertform.lion";
	}
	
	// 계좌관리팝업
	@RequestMapping("/point_accountmanageform.lion")
	public String pointAccountManageForm(HttpServletRequest request, Model model)
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
		ArrayList<AccountDTO> accountList = dao.accountList(member_code);
		model.addAttribute("accountList", accountList);

		return "/WEB-INF/view/user_mypage_point_accountManage_popup.jsp";
	}
	// 대표계좌설정
	@RequestMapping("/point_updatemainaccount.lion")
	public String pointUpdateMainAccount(HttpServletRequest request, Model model)
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
		HashMap<String, String> params = new HashMap<String, String>();
		String account_code = request.getParameter("code");
		params.put("code", account_code);
		params.put("member_code", member_code);
		dao.updateMainAccount(params);
		
		model.addAttribute("updateCode", true);
		return "redirect:point_accountmanageform.lion";
	}
	// 계좌삭제
	@RequestMapping("/point_deleteaccount.lion")
	public String pointDeleteAccount(HttpServletRequest request, Model model)
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
		String account_code = request.getParameter("code");
		if (dao.isMainAccount(account_code) < 1)
		{
			dao.deleteAccount(account_code);
			model.addAttribute("deleteCode", true);
		}
		return "redirect:point_accountmanageform.lion";
	}
	
	// 충전팝업
	@RequestMapping("/point_chargeform.lion")
	public String pointChargeForm(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		if (session.getAttribute("member_code") == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/user_mypage_point_charge_popup.jsp";
	}
	
	// 인출팝업
	@RequestMapping("/point_withdrawform.lion")
	public String pointWithdrawForm(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		if (session.getAttribute("member_code") == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/user_mypage_point_withdrawal_popup.jsp";
	}
	// 
	// ---------------------------------------- 포인트 ----------------------------------------
	
	// ------------------------------------- 개인정보수정 -------------------------------------
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
	
	// 회원탈퇴안내 페이지
	@RequestMapping("/mypage_withdrawnotice.lion")
	public String myInfoWithdrawNotice(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		if (session.getAttribute("member_code") == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}	
		return "/WEB-INF/view/user_mypage_myInfo_withdrawal.jsp";
	}
	
	// 회원탈퇴처리
	@RequestMapping("/mypage_memberwithdraw.lion")
	public String myInfoWithdraw(HttpServletRequest request, Model model)
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
		String pw = request.getParameter("pw");
		String pwCheck = dao.nowPwCheck(member_code);
		if (pw.equals(pwCheck))
		{
			dao.memberWithdraw(member_code);
			model.addAttribute("code", "withdraw");
			session.invalidate();
			return "redirect:main.lion";
		}
		else
		{
			model.addAttribute("errCase", true);
			return "redirect:mypage_withdrawnotice.lion";
		}
	}
	// ------------------------------------- 개인정보수정 -------------------------------------	
}
