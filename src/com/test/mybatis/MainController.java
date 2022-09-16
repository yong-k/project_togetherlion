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
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		String code = request.getParameter("code");
		String memberInBuypostStatus = null;
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		if (dao.isBlindBuypost(code) > 0)
		{
			model.addAttribute("blind", dao.isBlindBuypost(code));
		}
		else
		{
			BuypostDTO buypostArticle = dao.buypostArticle(code);
			ArrayList<MemberDTO> participant_info = dao.participant_info(code);
			String fixReplyCode = dao.fixReplyCode(code);
			ArrayList<BuypostReplyDTO> replyList = dao.replyList(code);
			
			model.addAttribute("buypost", buypostArticle);
			if (member_code != null)
			{
				HashMap<String, String> params = new HashMap<String, String>();
				params.put("member_code", member_code);
				params.put("buypost_code", code);
				
				// 찜
				int isWishlist = dao.isWishlist(params);
				model.addAttribute("isWishlist", isWishlist);
				
				// 공동구매 회원 상태
				memberInBuypostStatus = dao.memberInBuypostStatus(params);
				model.addAttribute("memberInBuypostStatus", memberInBuypostStatus);
			}
			
			// 공동구매 상태
			String buypostStatus = dao.buypostStatus(code);
			
			model.addAttribute("buypostStatus", buypostStatus);
			model.addAttribute("participant_info", participant_info);
			model.addAttribute("fixReplyCode", fixReplyCode);
			model.addAttribute("replyList", replyList);
		}
		return "/WEB-INF/view/user_buypostArticle.jsp";
	}
	
	// 댓글 등록
	@RequestMapping("/insertbuypostreply.lion")
	public String insertBuypostReply(HttpServletRequest request, Model model, BuypostReplyDTO reply) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		dao.insertReply(reply);
		return "redirect:buypostarticle.lion?code=" + reply.getBuypost_code();
	}
	
	// 댓글 수정
	@RequestMapping("/updatebuypostreply.lion")
	public String updateBuypostReply(HttpServletRequest request, Model model, BuypostReplyDTO reply) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		dao.updateReply(reply);
		return "redirect:buypostarticle.lion?code=" + reply.getBuypost_code();
	}
	
	// 댓글 삭제
	@RequestMapping("/deletebuypostreply.lion")
	public String updateBuypostReply(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		String buypost_code = request.getParameter("buypost");
		String reply_code = request.getParameter("reply");
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		dao.deleteReply(reply_code);
		return "redirect:buypostarticle.lion?code=" + buypost_code;
	}
	
	// 댓글 고정하기
	@RequestMapping("/fixbuypostreply.lion")
	public String fixBuypostReply(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		String buypost_code = request.getParameter("buypost");
		String reply_code = request.getParameter("reply");
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		dao.fixReply(reply_code);
		return "redirect:buypostarticle.lion?code=" + buypost_code;
	}
	
	// 댓글 고정취소
	@RequestMapping("/nofixbuypostreply.lion")
	public String noFixBuypostReply(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		String buypost_code = request.getParameter("buypost");
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		dao.noFixReply(buypost_code);
		return "redirect:buypostarticle.lion?code=" + buypost_code;
	}
	
	// 신고팝업
	@RequestMapping("/reportbuypost.lion")
	public String reportBuypost(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<ReportMainCategoryDTO> reportMaincateList = dao.reportMaincateList();
		ArrayList<ReportSubCategoryDTO> reportSubcateList = dao.reportSubcateList();
		String type = request.getParameter("type");
		String code = request.getParameter("code");
		if (type.equalsIgnoreCase("buypost"))
		{
			BuypostReportDTO buypostReport = dao.reportBuypost(code);
			model.addAttribute("report", buypostReport);
		}
		else if (type.equalsIgnoreCase("reply"))
		{
			BuypostReplyReportDTO buypostReplyReport = dao.reportBuypostReply(code);
			model.addAttribute("report", buypostReplyReport);
		}
		
		model.addAttribute("reportMaincateList", reportMaincateList);
		model.addAttribute("reportSubcateList", reportSubcateList);
		return "/WEB-INF/view/user_buypost_report_popup.jsp";
	}
	
	// 신고접수
	@RequestMapping("/insertreportbuypost.lion")
	public String insertReportBuypost(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		
		String type = request.getParameter("type");
		String code = request.getParameter("code");
		String main_cate_code = request.getParameter("cate");
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("member_code", member_code);
		params.put("main_cate_code", main_cate_code);
		if (type.equalsIgnoreCase("buypost"))
		{
			params.put("buypost_code", code);
			
			// 블라인드 게시물이면 신고 X
			if (dao.isBlindBuypost(code) > 0)
				model.addAttribute("res", "disable");
			else
			{
				dao.insertReportBuypost(params);
				model.addAttribute("res", "ok");
			}
		}
		else if (type.equalsIgnoreCase("reply"))
		{
			params.put("reply_code", code);
			
			// 블라인드 댓글이면 신고 X
			if (dao.isBlindBuypostReply(code) > 0)
				model.addAttribute("res", "disable");
			else
			{
				dao.insertReportBuypostReply(params);
				model.addAttribute("res", "ok");
			}
		}
		
		return "redirect:reportbuypost.lion?type="+type+"&code="+code;
	}
	
	// 찜 등록
	@RequestMapping("/insertwishlist.lion")
	public String insertWishlist(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		String buypost_code = request.getParameter("code");
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("member_code", member_code);
		params.put("buypost_code", buypost_code);
		dao.insertWishlist(params);
		
		return "redirect:buypostarticle.lion?code=" + buypost_code;
	}
	
	// 찜 해제
	@RequestMapping("/deletewishlist.lion")
	public String deleteWishlist(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		String buypost_code = request.getParameter("code");
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("member_code", member_code);
		params.put("buypost_code", buypost_code);
		dao.deleteWishlist(params);
		
		return "redirect:buypostarticle.lion?code=" + buypost_code;
	}
	
	// 결제 팝업
	@RequestMapping("/buypostpay.lion")
	public String buypostPay(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		model.addAttribute("pointAmount", dao.pointAmount(member_code));
		return "/WEB-INF/view/user_buypost_pay_popup.jsp";
	}
	// 결제(공동구매 참여)
	@RequestMapping("/insertparticipant.lion")
	public String insertParticipant(HttpServletRequest request, Model model, ParticipantDTO participant) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		String amount = (participant.getAmount()).replaceAll(",", "");
		participant.setAmount(amount);
		
		dao.insertParticipant(participant);
		model.addAttribute("status", "participate");
		return "redirect:buypostpay.lion?type=participant";
	}
	// 결제(<추가 참여>
	@RequestMapping("/updateparticipant.lion")
	public String updateParticipant(HttpServletRequest request, Model model, ParticipantDTO participant) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		String amount = (participant.getAmount()).replaceAll(",", "");
		participant.setAmount(amount);
		
		dao.updateParticipant(participant);
		model.addAttribute("status", "add");
		return "redirect:buypostpay.lion?type=participant";
	}
		
	// ------------------------------------------------------------------ 공동구매 게시물 상세보기
}
