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
import org.springframework.web.bind.annotation.RequestParam;

import com.test.util.Pagination;
import com.test.util.Search_buypost;

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
	// 공동구매 목록 -----------------------------------------------------------------------------
	// 메인
	@RequestMapping("/main.lion")
	public String main(HttpServletRequest request, Model model) 
	{
		HttpSession session = request.getSession();
		String user_region = (String)session.getAttribute("user_region");
		String region = request.getParameter("region");
		
		if (user_region == null || (region != null && !user_region.equals(region)))
		{
			user_region = region;
			if (user_region == null || user_region == "") 
				user_region = "";
			session.setAttribute("user_region", user_region);
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<BuypostDTO> buypostList_main = dao.buypostList_main(user_region);	
		model.addAttribute("buypostList", buypostList_main);
		return "/WEB-INF/view/user_main.jsp";
	}
	
	// 지도
	@RequestMapping("/map_main.lion")
	public String map(HttpServletRequest request, Model model) 
	{
		return "/WEB-INF/view/user_map_main.jsp";
	}	
	
	// 공동구매 목록 - 카테고리
	@RequestMapping("/buypostcategory.lion")
	public String buypostList_category(HttpServletRequest request, Model model
			  , @RequestParam(required = false, defaultValue = "1") int page
			  , @RequestParam(required = false, defaultValue = "1") int range) throws Exception
	{
		HttpSession session = request.getSession();
		String user_region = (String)session.getAttribute("user_region");
		if (user_region == null || user_region == "") 
			user_region = "";
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		String main_cate_code = request.getParameter("main");
		String sub_cate_code = request.getParameter("sub");
		if (main_cate_code == null)
			main_cate_code = dao.searchMainCate(sub_cate_code);
		if (sub_cate_code == null)
			sub_cate_code = "";
		
		ArrayList<SubCategoryDTO> categoryList = dao.categoryList(main_cate_code);

		Search_buypost search = new Search_buypost();
		search.setListSize(24);
		search.setUser_region(user_region);
		search.setMain_cate_code(main_cate_code);
		search.setSub_cate_code(sub_cate_code);
		
		int listCnt = dao.count_category(search);
		search.pageInfo(page, range, listCnt);
		ArrayList<BuypostDTO> buypostList_category = dao.buypostList_category(search);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("pagination", search);
		model.addAttribute("buypostList", buypostList_category);
		return "/WEB-INF/view/user_buypost_category.jsp";
	}
	
	// 공동구매 목록 - 최근공구
	@RequestMapping("/buypostnew.lion")
	public String buypostList_new(HttpServletRequest request, Model model
			  , @RequestParam(required = false, defaultValue = "1") int page
			  , @RequestParam(required = false, defaultValue = "1") int range) throws Exception
	{
		HttpSession session = request.getSession();
		String user_region = (String)session.getAttribute("user_region");
		if (user_region == null || user_region == "") 
			user_region = "";
		String main_cate_code = request.getParameter("maincate");
		if (main_cate_code == null || main_cate_code == "")
			main_cate_code = "%";
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<MainCategoryDTO> mainCateList = dao.mainCateList();
		
		Search_buypost search = new Search_buypost();
		search.setListSize(24);
		search.setUser_region(user_region);
		search.setMain_cate_code(main_cate_code);
		
		int listCnt = dao.count_new(search);
		search.pageInfo(page, range, listCnt);
		ArrayList<BuypostDTO> buypostList_new = dao.buypostList_new(search);
		
		model.addAttribute("mainCateList", mainCateList);
		model.addAttribute("pagination", search);
		model.addAttribute("buypostList", buypostList_new);
		return "/WEB-INF/view/user_buypost_new.jsp";
	}
	
	// 공동구매 목록 - 마감임박
	@RequestMapping("/buypostfinal.lion")
	public String buypostList_final(HttpServletRequest request, Model model
			  , @RequestParam(required = false, defaultValue = "1") int page
			  , @RequestParam(required = false, defaultValue = "1") int range) throws Exception
	{
		HttpSession session = request.getSession();
		String user_region = (String)session.getAttribute("user_region");
		if (user_region == null || user_region == "") 
			user_region = "";
		String main_cate_code = request.getParameter("maincate");
		if (main_cate_code == null || main_cate_code == "")
			main_cate_code = "%";
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<MainCategoryDTO> mainCateList = dao.mainCateList();
		
		Search_buypost search = new Search_buypost();
		search.setListSize(24);
		search.setUser_region(user_region);
		search.setMain_cate_code(main_cate_code);
		
		int listCnt = dao.count_final(search);
		search.pageInfo(page, range, listCnt);
		ArrayList<BuypostDTO> buypostList_final = dao.buypostList_final(search);
		
		model.addAttribute("mainCateList", mainCateList);
		model.addAttribute("pagination", search);
		model.addAttribute("buypostList", buypostList_final);
		return "/WEB-INF/view/user_buypost_final.jsp";
	}
	
	// 공동구매 목록 - 검색
	@RequestMapping("/buypostsearch.lion")
	public String buypostList_search(HttpServletRequest request, Model model
			  , @RequestParam(required = false, defaultValue = "1") int page
			  , @RequestParam(required = false, defaultValue = "1") int range) throws Exception
	{
		HttpSession session = request.getSession();
		String user_region = (String)session.getAttribute("user_region");
		if (user_region == null || user_region == "") 
			user_region = "";
		String main_cate_code = request.getParameter("maincate");
		if (main_cate_code == null || main_cate_code == "")
			main_cate_code = "%";
		String searchType = request.getParameter("search");
		if (searchType == null || searchType == "")
			searchType = "%";
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<MainCategoryDTO> mainCateList = dao.mainCateList();
		
		Search_buypost search = new Search_buypost();
		search.setListSize(24);
		search.setUser_region(user_region);
		search.setMain_cate_code(main_cate_code);
		search.setSearchType(searchType);
		
		int listCnt = dao.count_search(search);
		search.pageInfo(page, range, listCnt);
		ArrayList<BuypostDTO> buypostList_search = dao.buypostList_search(search);
		
		model.addAttribute("mainCateList", mainCateList);
		model.addAttribute("pagination", search);
		model.addAttribute("buypostList", buypostList_search);
		return "/WEB-INF/view/user_buypost_search.jsp";
	}
	// ----------------------------------------------------------------------------- 공동구매 목록 
	
	// 공동구매 게시물 상세보기 ------------------------------------------------------------------
	
	// 상세보기
	@RequestMapping("/buypostarticle.lion")
	public String buypostArticle(HttpServletRequest request, Model model) 
	{
		String code = request.getParameter("code");
		System.out.println(code);
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		BuypostDTO buypostArticle = dao.buypostArticle(code);
		ArrayList<MemberDTO> participant_info = dao.participant_info(code);
		
		model.addAttribute("buypost", buypostArticle);
		model.addAttribute("participant_info", participant_info);
		return "/WEB-INF/view/user_buypostArticle.jsp";
	}
	// ------------------------------------------------------------------ 공동구매 게시물 상세보기
}
