package com.test.mybatis;

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
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		String member_code = (String)session.getAttribute("member_code");
		if (member_code != null)
		{
			String nickname = (dao.searchMember(member_code)).getNickname();
			model.addAttribute("nickname", nickname);
		}
		return "/WEB-INF/view/user_header.jsp";
	}
	
	// footer
	@RequestMapping("/footer.lion")
	public String footer() {
		return "/WEB-INF/view/user_footer.jsp";
	}
	
	// 메인
	@RequestMapping("/main.lion")
	public String main() {
		return "/WEB-INF/view/user_main.jsp";
	}
	
	
}
