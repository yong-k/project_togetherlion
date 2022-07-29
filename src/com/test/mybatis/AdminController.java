package com.test.mybatis;

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
}
