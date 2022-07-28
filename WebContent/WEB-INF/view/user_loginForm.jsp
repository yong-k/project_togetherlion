<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
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

	$().ready(function()
	{
		$("#loginBtn").click(function()
		{
			if ($("#id").val() == "" || $("#pw").val() == "")
			{
				alert("아이디/비밀번호를 모두 입력해주세요.");
				return;
			}
			else
			{
				// @ 있으면 회원테이블 scan, 없으면 관리자테이블 scan
				if (($("#id").val()).indexOf("@") !== -1)
					$("#loginForm").attr("action", "loginmember.lion");
				else
					$("#loginForm").attr("action", "loginadmin.lion");
				
				$("#loginForm").submit();
			}
		});
	})




/*
	$(document).ready(function()		
	{
		$("#loginBtn").click(function()
		{
			if ($("#id").val() == "" || $("#pw").val() == "")
			{
				alert("항목을 모두 입력해야 합니다.");
				return;
			}
			else
			{
				var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if (!email.test($("#id").val()))
				{
					$("#loginForm").attr("action", "loginadmin.lion");
				}
				else
				{
					$("#loginForm").attr("action", "loginmember.lion");
				}
				
				$("#loginForm").submit();
			}		
		});
	});
*/	
</script> 
</head>
<body>
	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
     
    <section class="featured spad">
        <div class="container login-container">
			<div class="login">
				<h3 class="title">로그인</h3>

				<form action="" class="login-form" id="loginForm" method="post">
					<div class="form-group">
						<input type="email" id="id" name="id" class="form-control login-form-control" placeholder="이메일 입력">
					</div>
					<div class="form-group">
						<input type="password" id="pw" name="pw" class="form-control login-form-control" placeholder="비밀번호 입력">
					</div>
					<div class="login-search-box">
						<div class="login-search">
							<a href="<%=cp%>/findidform.lion">아이디 찾기</a> | 
							<a href="<%=cp%>/findpwform.lion">비밀번호 찾기</a>
						</div>
					</div>
					<button type="button" class="btn btn-primary login-form-btn"
					id="loginBtn">로그인</button>
				</form>
				<button type="button" class="btn btn-outline-primary login-form-btn"
				onclick="location.href='<%=cp%>/joinform.lion'">회원가입</button>
			</div>
        </div>
    </section>

	<!-- import FOOTER -->
	<c:import url="/footer.lion"></c:import>
  
    <!-- js plugins -->
    <script src="<%=cp %>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=cp %>/js/bootstrap.min.js"></script>
    <script src="<%=cp %>/js/jquery.nice-select.min.js"></script>
    <script src="<%=cp %>/js/jquery-ui.min.js"></script>
    <script src="<%=cp %>/js/jquery.slicknav.js"></script>
    <script src="<%=cp %>/js/owl.carousel.min.js"></script>
    <script src="<%=cp %>/js/main.js"></script>
</body>
</html>