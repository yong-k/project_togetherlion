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
<title>admin_menubar</title>
</head>
<body>
	
	<!-- menubar -->
	<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">MENU</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#member" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-user icon"></i>
							</div> 회원조회
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="member" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_memberall.lion">전체회원</a> 
								<a class="nav-link" href="<%=cp %>/admin_memberban.lion">영구정지회원</a> 
								<a class="nav-link" href="<%=cp %>/admin_memberwithdrawal.lion">탈퇴회원</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#point" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-sack-dollar icon"></i>
							</div> 포인트조회
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="point" aria-labelledby="headingTwo"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_pointcharge.lion">포인트충전</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointpay.lion">포인트결제</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointrefund.lion">포인트환불</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointwithdraw.lion">포인트인출</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointcomplete.lion">완료포인트지급</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#homepage" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-landmark icon"></i>
							</div> 홈페이지관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="homepage" aria-labelledby="headingThree"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_noticelist.lion">공지사항</a> 
								<a class="nav-link" href="<%=cp %>/admin_categorylist.lion">카테고리</a> 
								<a class="nav-link" href="<%=cp %>/admin_mannerlist.lion">매너지수</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#cancel" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-circle-xmark icon"></i>
							</div> 미진행취소
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="cancel"
							aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_cancelreceptionlist.lion">접수내역</a>
								<a class="nav-link" href="<%=cp %>/admin_cancelhandlinglist.lion">처리내역</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#report" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-triangle-exclamation icon"></i>
							</div> 신고관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="report" aria-labelledby="headingFive"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_reportreceptionlist.lion">접수내역</a> 
								<a class="nav-link" href="<%=cp %>/admin_reporthandlinglist.lion">처리내역</a> 
								<a class="nav-link" href="<%=cp %>/admin_reportreasonlist.lion">사유관리</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#inquiry" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-circle-question icon"></i>
							</div> 문의관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="inquiry" aria-labelledby="headingSix"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_inquirylist.lion">1:1문의</a> 
								<a class="nav-link" href="<%=cp %>/admin_faqlist.lion">FAQ</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">ADMIN ACCOUNT</div>
						<a class="nav-link" href="<%=cp %>/admin_accountlist.lion">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-gears icon"></i>
							</div> 관리자계정관리
						</a>
					</div>
				</div>
			</nav>
		</div>
</body>
</html>
