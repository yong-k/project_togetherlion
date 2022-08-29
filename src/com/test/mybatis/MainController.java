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
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	// header
	@RequestMapping("/header.lion")
	public String header(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code != null)
		{
			// header:닉네임
			String nickname = null;
			if (Integer.parseInt(member_code.substring(1)) > 10)
			{
				// 회원
				IMemberDAO member = sqlSession.getMapper(IMemberDAO.class);
				nickname = (member.searchMember(member_code)).getNickname();
			}
			else
			{
				// 관리자
				IAdminDAO admin = sqlSession.getMapper(IAdminDAO.class);
				nickname = (admin.searchAdmin(member_code)).getName() + "(관리자)";
			}
			model.addAttribute("nickname", nickname);
		}
		
		// header:카테고리
		IBuypostDAO buypost = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<MainCategoryDTO> mainCateList = buypost.mainCateList();
		model.addAttribute("mainCateList", mainCateList);
		
		return "/WEB-INF/view/user_header.jsp";
	}
	
	// footer
	@RequestMapping("/footer.lion")
	public String footer() {
		return "/WEB-INF/view/user_footer.jsp";
	}
	
	// 메인
	@RequestMapping("/main.lion")
	public String main(HttpServletRequest request, Model model) 
	{
		HttpSession session = request.getSession();
		String user_region = (String)session.getAttribute("user_region");
		if (user_region == null) 
			user_region = "";
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<BuypostDTO> buypostList_main = dao.buypostList_main(user_region);	
		model.addAttribute("buypostList", buypostList_main);
		return "/WEB-INF/view/user_main.jsp";
	}
	
	// 공동구매 목록 - 메인카테고리
	@RequestMapping("/buypostmaincate.lion")
	public String buypostList_mainCate(HttpServletRequest request, Model model)
	{
		return "/WEB-INF/view/user_buypost_category.jsp";
	}
	
	// 공동구매 목록 - 서브카테고리
	@RequestMapping("/buypostsubcate.lion")
	public String buypostList_subCate(HttpServletRequest request, Model model)
	{
		return "/WEB-INF/view/user_buypost_category.jsp";
	}
	
	// 공동구매 목록 - 최근공구
	@RequestMapping("/buypostnew.lion")
	public String buypostList_new(HttpServletRequest request, Model model)
	{
		return "/WEB-INF/view/user_buypost_new.jsp";
	}
	
	// 공동구매 목록 - 마감임박
	@RequestMapping("/buypostfinal.lion")
	public String buypostList_final(HttpServletRequest request, Model model)
	{
		return "/WEB-INF/view/user_buypost_final.jsp";
	}
	
	// 공동구매 목록 - 검색
	@RequestMapping("/buypostsearch.lion")
	public String buypostList_search(HttpServletRequest request, Model model)
	{
		return "/WEB-INF/view/user_buypost_search.jsp";
	}
	
}
