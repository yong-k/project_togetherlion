<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String member_code = (String)session.getAttribute("member_code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>같이사자</title>
    <link rel="stylesheet" href="<%=cp %>/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=cp %>/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/userStyle.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$('#header-searchBtn').click(function()
		{
			let searchType = $.trim($('#searchType').val());
			location.href='buypostsearch.lion?search=' + searchType;
		});
	});

</script>		 	 
</head>
<body>	
  
    <header class="header">
        <div class="header__top lion_header_top"></div>

		<%
		if (member_code == null)
		{
		%>
        <div class="header__top">
        	<div class="header__top__right">
        		<div class="header__top__right__social">
        			<a href="<%=cp %>/joinform.lion">회원가입</a>
                </div>
                <div class="header__top__right__auth">
                    <a href="<%=cp %>/loginform.lion">로그인</a>
                </div>
                <div class="header__top__right__language">
                	<div><a href="<%=cp %>/user/user_cscenter_noticeMain.jsp">고객센터</a></div>
                    <span class="arrow_carrot-down"></span>
                    <ul class="cscenter_list">
                    	<li><a href="<%=cp %>/user/user_cscenter_noticeMain.jsp">공지사항</a></li>
                    	<li><a href="<%=cp %>/user/user_cscenter_faqMain.jsp">FAQ</a></li>
                    	<li><a href="<%=cp %>/user/user_cscenter_inquiryMain.jsp">1:1 문의</a></li>
                    </ul>
                 </div>
             </div> 
        </div>
        <%
		}
		else
		{
        %>
        <div class="header__top">
        	<div class="header__top__right">
                <div class="header__top__right__language header__nickname">
                	<div><span id="nickname">${nickname }</span> 님</div>
                    <span class="arrow_carrot-down"></span>
                    <ul>
                    	<li><a href="<%=cp %>/mypagemain.lion">마이페이지</a></li>
                    	<li><a href="<%=cp %>/logout.lion">로그아웃</a></li>
                    </ul>
                 </div>
                <div class="header__top__right__language">
                	<div>고객센터</div>
                    <span class="arrow_carrot-down"></span>
                    <ul class="cscenter_list">
                    	<li><a href="<%=cp %>/user/user_cscenter_noticeMain.jsp">공지사항</a></li>
                    	<li><a href="<%=cp %>/user/user_cscenter_faqMain.jsp">FAQ</a></li>
                    	<li><a href="<%=cp %>/user/user_cscenter_inquiryMain.jsp">1:1 문의</a></li>
                    </ul>
                 </div>
             </div> 
        </div>
		<%
		}
		%>
             
        <!-- LOGO -->
        <div class="header__logo">
        	<a href="<%=cp %>/main.lion">
        		<img class="user_logo" src="<%=cp %>/img/lion_logo.png"/>
        		같이사자
       		</a>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>전체 카테고리</span>
                        </div>
                        <ul style="display: none;">
                        	<c:forEach var="mainCate" items="${mainCateList }">
                        	<li><a href="buypostcategory.lion?main=${mainCate.code }">${mainCate.name }</a></li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
				<div class="col-lg-4">
					<nav class="header__menu">
						<ul>
							<li class="final"><a href="buypostfinal.lion">마감임박</a></li>
							<li class="active recent"><a href="buypostnew.lion">최근공구</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-5">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="">
								<input id="searchType" type="text" placeholder="검색어를 입력해주세요.">
								<button type="button" class="site-btn" id="header-searchBtn">
									<i class="bi bi-search"></i>
								</button>
							</form>
						</div>
						<div class="header__cart">
							<ul>
								<li><a href="#"><i class="fa fa-heart-o"></i></a></li>
								<li><a href="<%=cp %>/user/user_buypostInsertForm.jsp"><i class="bi bi-pencil-square"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
        </div>
    </section>
    <!-- Hero Section End -->

</body>
</html>