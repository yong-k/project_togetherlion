package com.test.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// header
	@RequestMapping("/adminheader.lion")
	public String adminHeader(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
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
	public String adminMain()
	{
		return "/WEB-INF/view/admin_main.jsp";
	}
	
	//『회원조회』	
	// 전체회원
	@RequestMapping("/admin_memberall.lion")
	public String memberAll()
	{
		return "/WEB-INF/view/admin_member_all.jsp";
	}
	// 영구정지회원
	@RequestMapping("/admin_memberban.lion")
	public String memberBan()
	{
		return "/WEB-INF/view/admin_member_permanentBan.jsp";
	}
	// 휴면회원
	@RequestMapping("/admin_membersleep.lion")
	public String memberSleep()
	{
		return "/WEB-INF/view/admin_member_sleep.jsp";
	}
	// 탈퇴회원
	@RequestMapping("/admin_memberwithdrawal.lion")
	public String memberWithdrawal()
	{
		return "/WEB-INF/view/admin_member_withdrawal.jsp";
	}
	
	//『포인트조회』
	// 포인트충전
	@RequestMapping("/admin_pointcharge.lion")
	public String pointCharge()
	{
		return "/WEB-INF/view/admin_point_charge.jsp";
	}
	// 포인트결제
	@RequestMapping("/admin_pointpay.lion")
	public String pointPay()
	{
		return "/WEB-INF/view/admin_point_payment.jsp";
	}
	// 포인트환불
	@RequestMapping("/admin_pointrefund.lion")
	public String pointRefund()
	{
		return "/WEB-INF/view/admin_point_refund.jsp";
	}
	// 포인트인출
	@RequestMapping("/admin_pointwithdraw.lion")
	public String pointWithdraw()
	{
		return "/WEB-INF/view/admin_point_withdrawal.jsp";
	}
	// 완료포인트지급
	@RequestMapping("/admin_pointcomplete.lion")
	public String pointComplete()
	{
		return "/WEB-INF/view/admin_point_complete.jsp";
	}
	
	//『홈페이지관리』
	// 공지사항목록
	@RequestMapping("/admin_noticelist.lion")
	public String noticeList()
	{
		return "/WEB-INF/view/admin_homepage_noticeList.jsp";
	}
	// 카테고리
	@RequestMapping("/admin_categorylist.lion")
	public String categoryList(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		ArrayList<MainCategoryDTO> mainCateList = dao.mainCateList();
		ArrayList<SubCategoryDTO> subCateList = dao.subCateList();
		model.addAttribute("mainCateList", mainCateList);
		model.addAttribute("subCateList", subCateList);
		return "/WEB-INF/view/admin_homepage_categoryList.jsp";
	}
	// 매너지수
	@RequestMapping("/admin_mannerlist.lion")
	public String mannerList(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		ArrayList<MannerLevelDTO> mannerList = dao.mannerList();
		model.addAttribute("mannerList", mannerList);
		return "/WEB-INF/view/admin_homepage_mannerLevelList.jsp";
	}
	
	//『미진행취소』
	// 접수내역
	@RequestMapping("/admin_cancelreceptionlist.lion")
	public String cancelReceptionList()
	{
		return "/WEB-INF/view/admin_cancel_receptionList.jsp";
	}
	// 처리내역
	@RequestMapping("/admin_cancelhandlinglist.lion")
	public String cancelHandlingList()
	{
		return "/WEB-INF/view/admin_cancel_handlingList.jsp";
	}
	
	//『신고관리』
	// 접수내역
	@RequestMapping("/admin_reportreceptionlist.lion")
	public String reportReceptionList()
	{
		return "/WEB-INF/view/admin_report_receptionList.jsp";
	}
	// 처리내역
	@RequestMapping("/admin_reporthandlinglist.lion")
	public String reportHandlingList()
	{
		return "/WEB-INF/view/admin_report_handlingList.jsp";
	}
	// 사유관리
	@RequestMapping("/admin_reportreasonlist.lion")
	public String reportReasonList(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		ArrayList<ReportMainCategoryDTO> reportMainCateList = dao.reportMainCateList();
		ArrayList<ReportSubCategoryDTO> reportSubCateList = dao.reportSubCateList();
		model.addAttribute("reportMainCateList", reportMainCateList);
		model.addAttribute("reportSubCateList", reportSubCateList);
		return "/WEB-INF/view/admin_report_reasonList.jsp";
	}
	
	//『문의관리』
	// 1:1문의목록
	@RequestMapping("/admin_inquirylist.lion")
	public String inquiryList()
	{
		return "/WEB-INF/view/admin_inquiry_inquiryList.jsp";
	}
	// FAQ목록
	@RequestMapping("/admin_faqlist.lion")
	public String faqList()
	{
		return "/WEB-INF/view/admin_inquiry_faqList.jsp";
	}
	
	//『관리자계정관리』
	// 목록
	@RequestMapping("/admin_accountlist.lion")
	public String accountList()
	{
		return "/WEB-INF/view/admin_accountList.jsp";
	}
}
