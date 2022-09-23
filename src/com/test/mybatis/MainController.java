package com.test.mybatis;

import java.io.IOException;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
	
	// <참여 취소>
	@RequestMapping("/deleteparticipant.lion")
	public String deleteParticipant(HttpServletRequest request, Model model, ParticipantDTO participant) 
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
		String buypost_code = request.getParameter("buypost_code");
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("buypost_code", buypost_code);
		params.put("member_code", member_code);
		
		dao.deleteParticipant(params);
		model.addAttribute("status", "cancel");
		return "redirect:buypostarticle.lion?code=" + buypost_code;
	}
	
	// <진행 취소>
	@RequestMapping("/cancelbuypost.lion")
	public String cancelBuypost(HttpServletRequest request, Model model, ParticipantDTO participant) 
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
		String buypost_code = request.getParameter("buypost_code");
		dao.cancleBuypost(buypost_code);
		
		model.addAttribute("status", "allcancel");
		return "redirect:main.lion";
	}
	// ------------------------------------------------------------------ 공동구매 게시물 상세보기
	
	
	// 공동구매 게시물 작성 ----------------------------------------------------------------------
	
	// 공동구매 게시물 작성폼
	@RequestMapping("/buypostinsertform.lion")
	public String buypostInsertForm(HttpServletRequest request, Model model) 
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
		ArrayList<MainCategoryDTO> mainCateList = dao.mainCateList();

		model.addAttribute("mainCateList", mainCateList);
		return "/WEB-INF/view/user_buypostInsertForm.jsp";
	}
	
	// 대분류에 따른 소분류 목록 가져오기
	@RequestMapping("/buypostsubcate.lion")
	public String buypostSubCate(HttpServletRequest request, Model model)
	{
		String ajaxCode = "buypostSubcate";
		String main_cate_code = request.getParameter("code");
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		ArrayList<SubCategoryDTO> subCateList = dao.subCateList(main_cate_code);
		
		model.addAttribute("ajaxCode", ajaxCode);
		model.addAttribute("subCateList", subCateList);
		return "/WEB-INF/view/user_buypostInsertForm_ajax.jsp";
	}
		
	// 공동구매 게시물 - 지도팝업
	@RequestMapping("/buypostmap.lion")
	public String buypostMap(HttpServletRequest request, Model model) 
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}

		return "/WEB-INF/view/user_map_buypost.jsp";
	}
	
	// 공동구매 게시물 insert
	@RequestMapping("/buypostinsert.lion")
	public String insertBuypost(HttpServletRequest request, Model model) throws IOException
	{
		// member_code(세션값) 확인
		HttpSession session = request.getSession();
		String member_code = (String)session.getAttribute("member_code");
		if (member_code == null)
		{
			model.addAttribute("errCase", "login");
			return "redirect:loginform.lion";
		}
		
		// 파일이 저장될 서버의 경로
		String savePath = request.getServletContext().getRealPath("img/buypost");
		
		// 파일 크기 15MB로 제한
		int sizeLimit = 1024*1024*15;
		
		// HttpServletRequest request	: request 객체
		// String saveDirectory			: 저장될 서버 경로
		// int maxPostSize				: 파일 최대 크기
		// String encoding				: 인코딩 방식
		// FileRenamePolicy				: 같은 이름의 파일명 방지 처리
		// 아래와 같이 MultipartRequest 를 생성만 해주면 파일이 업로드된다.(파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		// ================== 아래는 전송 받은 데이터를 DB 테이블에 저장하기 위한 작업 ==================
		
		// MultipartRequest 로 전송받은 데이터를 불러온다.
		// enctype을 "multipart/form-data"로 선언하고 submit 한 데이터들은
		// request 객체가 아닌 MultipartRequest 객체로 불러와야 한다.
		BuypostDTO buypost = new BuypostDTO();
		buypost.setAmount(multi.getParameter("amount"));
		buypost.setMember_code(member_code);
		String title = multi.getParameter("title");
		buypost.setTitle(title);
		String goods_photo_name = multi.getFilesystemName("goods_photo_name");
		String fileFullPath = savePath + "/" + goods_photo_name;
		buypost.setGoods_photo_name(goods_photo_name);
		buypost.setGoods_photo_path(fileFullPath);
		buypost.setUrl(multi.getParameter("url"));
		buypost.setContent(multi.getParameter("content"));
		buypost.setExpiration_datetime(multi.getParameter("expiration_datetime"));
		buypost.setTotal_price(multi.getParameter("total_price"));
		buypost.setGoods_num(multi.getParameter("goods_num"));
		buypost.setGoods_num(multi.getParameter("goods_num"));
		buypost.setDeadline(multi.getParameter("deadline"));
		buypost.setTrade_datetime(multi.getParameter("trade_datetime"));
		buypost.setLocation_x(multi.getParameter("location_x"));
		buypost.setLocation_y(multi.getParameter("location_y"));
		buypost.setRegion(multi.getParameter("region"));
		buypost.setSub_cate_code(multi.getParameter("sub_cate_code"));		
		buypost.setBuy_number(multi.getParameter("buy_number"));
		String content_photo_name = multi.getFilesystemName("content_photo_name");
		buypost.setContent_photo_name(content_photo_name);
		if (content_photo_name != null) {
			buypost.setContent_photo_path(fileFullPath);
		}
			 
		IBuypostDAO dao = sqlSession.getMapper(IBuypostDAO.class);
		dao.insertBuypost(buypost);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("member_code", member_code);
		params.put("title", title);
		String buypost_code = dao.showInsertBuypost(params);
		if (buypost_code == null) {
			model.addAttribute("errorCode", "insert");
			return "redirect:buypostinsertform.lion";
		}
		
		return "redirect:buypostarticle.lion?code=" + buypost_code;
	}
	
	// ---------------------------------------------------------------------- 공동구매 게시물 작성
}
