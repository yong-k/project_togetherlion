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

<style type="text/css">
.sidebar__item ul li:first-child {
	background-color: #f5f3ed;
}
.sidebar__item ul li:first-child a {
	color: #fc9942;
}
.sidebar__item ul li:first-child a i {
	color: #fc9942;
}
</style>
</head>
<body>
	<!-- import HEADER -->
	<c:import url="user_header.jsp"></c:import>

	<section class="product spad community-section">
		<div class="container">


			<div class="col-lg-12 col-md-12">
				<div class="communityMain-container">
					<div class="product__discount">
						<div class="section-title community-title">
							<h2>커뮤니티</h2>
						<select class="form-select title-head-select" aria-label="Default select example">
							<option value="0" selected>말머리 선택</option>
							<option value="1">소통해요</option>
							<option value="2">질문해요</option>
							<option value="3">같이사요</option>
						</select>
						</div>
					</div>
					
					<button type="button" class="btn btn-primary inquiryBtn communityBtn">글쓰기</button>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">136</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[소통해요]</span>가입했어요!!<span class="reply-count">[3]</span>
									</a>
								</td>
								<td>홍길동</td>
								<td>08:20</td>
								<td>3</td>
							</tr>
							<tr>
								<th scope="row">135</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[질문해요]</span>여기 뭐하는 사이트임?<span class="reply-count">[5]</span>
									</a>
								</td>
								<td>고길동</td>
								<td>2022-06-19</td>
								<td>404</td>
							</tr>
							<tr>
								<th scope="row">134</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[같이사요]</span>눈을감자 공구 좀 열어주실분;<span class="reply-count">[2]</span>
									</a>
								</td>
								<td>서소민</td>
								<td>2022-06-19</td>
								<td>21</td>
							</tr>
							<tr>
								<th scope="row">133</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[소통해요]</span>다들 소통 좀 하자고요<span class="reply-count">[3]</span>
									</a>
								</td>
								<td>김뫄뫄</td>
								<td>2022-06-17</td>
								<td>4</td>
							</tr>
							<tr>
								<th scope="row">132</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[질문해요]</span>여름 좋아하시나요?<span class="reply-count">[5]</span>
									</a>
								</td>
								<td>이뫄뫄</td>
								<td>2022-06-16</td>
								<td>9</td>
							</tr>
							<tr>
								<th scope="row">131</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[같이사요]</span>김수미 간장게장 5kg 같이사실 분~<span class="reply-count">[3]</span>
									</a>
								</td>
								<td>박뫄뫄</td>
								<td>2022-06-06</td>
								<td>5</td>
							</tr>
							<tr>
								<th scope="row">130</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[소통해요]</span>고민들어주는 남자.<span class="reply-count">[3]</span>
									</a>
								</td>
								<td>서장훈</td>
								<td>2022-06-05</td>
								<td>20</td>
							</tr>
							<tr>
								<th scope="row">129</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[질문해요]</span>초밥 맛있는 곳 아세요?<span class="reply-count">[2]</span>
									</a>
								</td>
								<td>박용석</td>
								<td>2022-06-03</td>
								<td>36</td>
							</tr>
							<tr>
								<th scope="row">128</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[같이사요]</span>올리브 치아바타 같이사요~<span class="reply-count">[5]</span>
									</a>
								</td>
								<td>신시은</td>
								<td>2022-06-02</td>
								<td>100</td>
							</tr>
							<tr>
								<th scope="row">127</th>
								<td class="title">
									<a href="#!">
										<span class="title-head">[소통해요]</span>이수만 사장님 죄송해요<span class="reply-count">[988]</span>
									</a>
								</td>
								<td>박찬열</td>
								<td>2022-06-01</td>
								<td>900</td>
							</tr>
						</tbody>
					</table>

					<!-- page navigation -->
					<nav class="pageNav" aria-label="Page navigation example">
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

					<!-- searchbar -->
					<div class="searchbar">
						<div class="searchContent">
							<form action="#">
								<select class="form-select community-select" aria-label="Default select example">
									<option value="0" selected>제목</option>
									<option value="1">내용</option>
									<option value="2">닉네임</option>
								</select> <input class="form-control" type="text"
									aria-label="Search for..." aria-describedby="btnNavbarSearch" />
								<button class="btn btn-primary" id="btnNavbarSearch"
									type="button">
									<i class="bi bi-search tableSearch"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- import FOOTER -->
	<c:import url="user_footer.jsp"></c:import>

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