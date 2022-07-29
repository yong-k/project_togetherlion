<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>admin같이사자</title>

<link href="<%=cp %>/css/adminStyle.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%=cp %>/js/scripts.js"></script>
	
<style type="text/css">
.sb-sidenav-menu a.current-menu {
    background-color: #f5f4f2;
    color: #fca652 !important;
}
</style>	

</head>
<body class="sb-nav-fixed">

	<!-- import HEADER -->
	<c:import url="/adminheader.lion"></c:import>

	<div id="layoutSidenav">

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
								<a class="nav-link" href="<%=cp %>/admin_membersleep.lion">휴면회원</a> 
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
						<div class="collapse show" id="inquiry" aria-labelledby="headingSix"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_inquirylist.lion">1:1문의</a> 
								<a class="nav-link current-menu" href="<%=cp %>/admin_faqlist.lion">FAQ</a>
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

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4 admin-table-body">

						<!--  Breadcrumb -->
						<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">문의관리</li>
								<li class="breadcrumb-item active" aria-current="page"><a
									href="#">FAQ</a></li>
							</ol>
						</nav>

						<div>
							<!-- searchBar -->
							<form class="search-form" action="#">
								<select class="form-select" aria-label="Default select example">
									<option value="1" selected>제목</option>
									<option value="2">내용</option>
								</select> 
								<input class="form-control" type="text" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
								<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
							</form>
							
							<button type="button" class="btn btn-secondary writeBtn" onclick="location.href='admin_inquiry_faqInsertForm.jsp'">글쓰기</button>
						</div>

						<div class="card-body">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자ID</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>3</td>
										<td><a href="admin_inquiry_faqArticle.jsp">포인트 충전은 어디서 하나요?</a></td>
										<td>ej456</td>
										<td>2022-05-24</td>
									</tr>
									<tr>
										<td>2</td>
										<td><a href="admin_inquiry_faqArticle.jsp">회원 정보를 수정하고 싶어요.</a></td>
										<td>sj321</td>
										<td>2022-05-21</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- page navigation -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link"
									href="javascript:void(0);" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:void(0);">1</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:void(0);">2</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:void(0);">3</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:void(0);">4</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:void(0);">5</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:void(0);" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</main>

			<!-- import FOOTER -->
			<c:import url="/adminfooter.lion"></c:import>

		</div>
	</div>
</body>
</html>
