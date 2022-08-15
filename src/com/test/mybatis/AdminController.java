package com.test.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// header
	@RequestMapping("/adminheader.lion")
	public String adminHeader(HttpServletRequest request, Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		String adminName = (dao.searchAdmin(member_code)).getName();
		model.addAttribute("adminName", adminName);
		return "/WEB-INF/view/admin_header.jsp";
	}
	
	// footer
	@RequestMapping("/adminfooter.lion")
	public String adminFooter()
	{
		return "/WEB-INF/view/admin_footer.jsp";
	}
	
	// menubar
	@RequestMapping("/adminmenubar.lion")
	public String adminMenubar()
	{
		return "/WEB-INF/view/admin_menubar.jsp";
	}
	
	// 관리자 메인
	@RequestMapping("/admin.lion")
	public String adminMain(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		return "/WEB-INF/view/admin_main.jsp";
	}
	
	// ------------------------------------------- 회원조회 -------------------------------------------
	// 전체회원
	@RequestMapping("/admin_memberall.lion")
	public String memberAll(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_member_all.jsp";
	}
	// 영구정지회원
	@RequestMapping("/admin_memberban.lion")
	public String memberBan(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_member_permanentBan.jsp";
	}
	// 휴면회원
	@RequestMapping("/admin_membersleep.lion")
	public String memberSleep(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_member_sleep.jsp";
	}
	// 탈퇴회원
	@RequestMapping("/admin_memberwithdrawal.lion")
	public String memberWithdrawal(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_member_withdrawal.jsp";
	}
	// ------------------------------------------- 회원조회 -------------------------------------------
	
	// ------------------------------------------ 포인트조회 ------------------------------------------
	// 포인트충전
	@RequestMapping("/admin_pointcharge.lion")
	public String pointCharge(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_point_charge.jsp";
	}
	// 포인트결제
	@RequestMapping("/admin_pointpay.lion")
	public String pointPay(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_point_payment.jsp";
	}
	// 포인트환불
	@RequestMapping("/admin_pointrefund.lion")
	public String pointRefund(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_point_refund.jsp";
	}
	// 포인트인출
	@RequestMapping("/admin_pointwithdraw.lion")
	public String pointWithdraw(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_point_withdrawal.jsp";
	}
	// 완료포인트지급
	@RequestMapping("/admin_pointcomplete.lion")
	public String pointComplete(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_point_complete.jsp";
	}
	// ------------------------------------------ 포인트조회 ------------------------------------------
	
	// ----------------------------------------- 홈페이지관리 -----------------------------------------
	// 공지사항목록
	@RequestMapping("/admin_noticelist.lion")
	public String noticeList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_homepage_noticeList.jsp";
	}
	// 카테고리
	@RequestMapping("/admin_categorylist.lion")
	public String categoryList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		ArrayList<MainCategoryDTO> mainCateList = dao.mainCateList();
		ArrayList<SubCategoryDTO> subCateList = dao.subCateList();
		model.addAttribute("mainCateList", mainCateList);
		model.addAttribute("subCateList", subCateList);
		return "/WEB-INF/view/admin_homepage_categoryList.jsp";
	}
	// 매너지수
	@RequestMapping("/admin_mannerlist.lion")
	public String mannerList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		ArrayList<MannerLevelDTO> mannerList = dao.mannerList();
		model.addAttribute("mannerList", mannerList);
		return "/WEB-INF/view/admin_homepage_mannerLevelList.jsp";
	}
	// ----------------------------------------- 홈페이지관리 -----------------------------------------
	
	// ------------------------------------------ 미진행취소 ------------------------------------------
	// 접수내역
	@RequestMapping("/admin_cancelreceptionlist.lion")
	public String cancelReceptionList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_cancel_receptionList.jsp";
	}
	// 처리내역
	@RequestMapping("/admin_cancelhandlinglist.lion")
	public String cancelHandlingList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_cancel_handlingList.jsp";
	}
	// ------------------------------------------ 미진행취소 ------------------------------------------
	
	// ------------------------------------------- 신고관리 -------------------------------------------
	// 접수내역
	@RequestMapping("/admin_reportreceptionlist.lion")
	public String reportReceptionList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_report_receptionList.jsp";
	}
	// 처리내역
	@RequestMapping("/admin_reporthandlinglist.lion")
	public String reportHandlingList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_report_handlingList.jsp";
	}
	// 사유관리
	@RequestMapping("/admin_reportreasonlist.lion")
	public String reportReasonList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		ArrayList<ReportMainCategoryDTO> reportMainCateList = dao.reportMainCateList();
		ArrayList<ReportSubCategoryDTO> reportSubCateList = dao.reportSubCateList();
		model.addAttribute("reportMainCateList", reportMainCateList);
		model.addAttribute("reportSubCateList", reportSubCateList);
		return "/WEB-INF/view/admin_report_reasonList.jsp";
	}
	// ------------------------------------------- 신고관리 -------------------------------------------
	
	// ------------------------------------------- 문의관리 -------------------------------------------
	// 1:1문의목록
	@RequestMapping("/admin_inquirylist.lion")
	public String inquiryList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_inquiry_inquiryList.jsp";
	}
	// FAQ목록
	@RequestMapping("/admin_faqlist.lion")
	public String faqList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}		
		return "/WEB-INF/view/admin_inquiry_faqList.jsp";
	}
	// ------------------------------------------- 문의관리 -------------------------------------------
	
	// ---------------------------------------- 관리자계정관리 ----------------------------------------
	// 목록
	@RequestMapping("/admin_accountlist.lion")
	public String accountList(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		ArrayList<AdminDTO> adminList = dao.adminList();
		int adminCount = dao.adminCount();
		model.addAttribute("adminList", adminList);
		model.addAttribute("adminCount", adminCount);
		return "/WEB-INF/view/admin_accountList.jsp";
	}
	
	// 계정생성폼
	@RequestMapping("/admin_accountinsertform.lion")
	public String accountInsertForm(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (!member_code.equals("M1"))
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		return "/WEB-INF/view/admin_accountInsertForm.jsp";
	}
	// 아이디 중복체크
	@RequestMapping("/admin_idcheck.lion")
	public String idCheck(HttpServletRequest request, Model model)
	{
		String ajaxCode = "admin_idCheck";
		String id = request.getParameter("id");
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		int checkId = dao.checkId(id);
		model.addAttribute("ajaxCode", ajaxCode);
		model.addAttribute("checkId", checkId);
		return "/WEB-INF/view/ajax.jsp";
	}
	
	// 휴대폰번호 중복체크 및 인증번호 관련 ajax처리는 회원꺼 사용 (LoginController)
	
	// 계정생성
	@RequestMapping("/admin_accountinsert.lion")
	public String adminInsert(HttpServletRequest request, AdminDTO admin, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (!member_code.equals("M1"))
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
				
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		dao.insertAdmin(admin);
		int joinCheck = dao.checkId(admin.getId());
		session.removeAttribute("smsCode");
		model.addAttribute("joinCheck", joinCheck);
		return "redirect:admin_accountinsertform.lion";
	}
	
	// 계정수정폼
	@RequestMapping("/admin_accountupdateform.lion")
	public String accountUpdateForm(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String id = request.getParameter("id");
		AdminDTO admin = dao.adminInfo(id);
		model.addAttribute("admin", admin);
		return "/WEB-INF/view/admin_accountUpdateForm.jsp";
	}
	
	// 계정수정
	@RequestMapping("/admin_accountupdate.lion")
	public String adminUpdate(HttpServletRequest request, AdminDTO admin, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null || Integer.parseInt(member_code.substring(1)) > 10)
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		
		// 계정수정폼에 호출할 때 주소에 id 전달하면서 보내줘야해서!
		String id = request.getParameter("id");
		model.addAttribute("id", id);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		// 입력한 현재 비밀번호 == 현재 비밀번호 확인
		String nowPwCheck = dao.pwCheck(admin.getId());
		String nowPw = request.getParameter("nowPw");
		
		System.out.println(admin.getTel());
		System.out.println(admin.getId());
		System.out.println(nowPwCheck);
		System.out.println("입력: " + nowPw);
		
		if(!nowPw.equals(nowPwCheck))
		{
			model.addAttribute("errCase", true);
		}
		else
		{
			if (admin.getPw() == "")
				admin.setPw(nowPwCheck);
			dao.updateAdmin(admin);
			model.addAttribute("updateCheck", "ok");
		}
		
		
		return "redirect:admin_accountupdateform.lion";
	}
	
	// 계정삭제
	@RequestMapping("/admin_accountdelete.lion")
	public String adminDelete(HttpServletRequest request, Model model)
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (!member_code.equals("M1"))
		{
			session.invalidate();
			model.addAttribute("errCase", "login_admin");
			return "redirect:loginform.lion";
		}
		
		String id = request.getParameter("id");
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		dao.deleteAdmin(id);
		model.addAttribute("deleteCheck", "ok");
		return "redirect:admin_accountlist.lion";
	}
	
	// ---------------------------------------- 관리자계정관리 ----------------------------------------
}
