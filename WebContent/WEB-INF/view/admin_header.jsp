<%@page import="com.test.mybatis.AdminDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>admin_header</title>
</head>
<body>

	<!-- header -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-topnav">
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>

		<!-- LOGO -->
		<a class="navbar-brand ps-3" href="<%=cp %>/admin.lion">
			<div id="admin_logo">admin</div>
			<div id="lion_logo">같이사자</div>
		</a>
		
		<div class="header-outer">
			<!-- Profile -->
			<div class="header-inner">
				<div class="profile_nickname">${adminName } 님</div>
				<button id="logoutBtn" type="button" class="btn btn-secondary"
				onclick="location.href='<%=cp %>/logout.lion'">로그아웃</button>
			</div>

			<!-- Link to user-main -->
			<div class="user-main">
				<a class="navbar-brand ps-3" href="<%=cp %>/main.lion">
					<div id="admin_logo">user</div>
					<div id="lion_logo">같이사자</div>
				</a>
			</div>
			<a href="<%=cp %>/main.lion"><div class="go">GO</div></a>
		</div>
	</nav>

</body>
</html>
