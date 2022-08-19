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
	
<style type="text/css">
.sidebar__item ul li:nth-child(4) {
	background-color: #f5f3ed;
}
.sidebar__item ul li:nth-child(4) a {
	color: #fc9942;
}
.sidebar__item ul li:nth-child(4) a i {
	color: #fc9942;
}
</style>
<script type="text/javascript">
	
	$(function()
	{
		let type = '<%=request.getParameter("type")%>';
		let value = '';
		if (type === 'null')
			value = '전체';
		else if (type === 'charge')
			value = '충전';
		else if (type === 'pay')
			value = '결제';
		else if (type === 'withdraw')
			value = '인출';
		else if (type === 'refund')
			value = '환불';
		else if (type === 'complete')
			value = '지급';
		
		$('span.current').html(value);
		
		$('.point-select').on("change", function()
		{
			location.href = 'mypage_point.lion?type=' + $(this).val();
		});
	});
	
	// 팝업창
	// ① 충전
	function charge()
	{	
		window.open("point_chargeform.lion", "_blank", "top=150,left=550,width=505,height=685");
	}
	// ② 인출
	function withdrawal()
	{	
		window.open("point_withdrawform.lion", "_blank", "top=150,left=550,width=505,height=685");
	}
	// ③ 계좌관리
	function accountManage()
	{	
		window.open("point_accountmanageform.lion", "_blank", "top=150,left=550,width=505,height=685");
	}
</script>		 
</head>
<body>
	
	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
	
	<!-- mypage_point HEADER -->
	<div class="hero__item set-bg mypage-header">
		<div class="mypage-box-container">
			<div class="mypage-header-userBox myPoint-box">
				<div class="mypage-profile-photo">
					<img src="img/mannerLevel/${member.photo_name }" class="mannerLevel-photo">
				</div>
				<div class="mypage-info-box myPoint-info-box">
					<div class="buypost_profile_nickname participate-profile-nickname">${member.nickname } 님</div>
					<h4 class="header-title-point myPoint-title">보유 포인트</h4>
					<h2 class="myPointAmount">${point } 원</h2>
				</div>
				<div class="myPoint-btn-box">
					<button type="button" class="btn btn-primary pointBtn charge-btn"
					onclick="javascript:charge()">충전하기</button>
					<button type="button" class="btn btn-primary pointBtn withdraw-btn"
					onclick="javascript:withdrawal()">인출하기</button>
					<button type="button" class="btn btn-primary pointBtn manageAccount-btn"
					onclick="javascript:accountManage()">계좌관리</button>
				</div>
			</div>
		</div>
	</div>
    
	<!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
			<div class="row featured__filter">

				<!-- import mypage_MENUBAR -->
				<c:import url="user_mypage_menubar.jsp"></c:import>

				<div class="col-lg-9 col-md-7">
					<div class="product__discount myPoint-title-box">
						<div class="section-title product__discount__title myPoint-title">
							<h2>사용내역</h2>
						</div>
						<div class="myPoint-form-box">
							<select id="pointType" class="form-select point-select" aria-label="Default select example"
							style="display: none;">
								<option value="%">전체</option>
								<option value="charge">충전</option>
								<option value="pay">결제</option>
								<option value="withdraw">인출</option>
								<option value="refund">환불</option>
								<option value="complete">지급</option>
							</select>
							<div class="nice-select form-select point-select" tabindex="0">
								<span class="current"></span>
								<ul class="list">
									<li data-value="%" class="option">전체</li>
									<li data-value="charge" class="option">충전</li>
									<li data-value="pay" class="option">결제</li>
									<li data-value="withdraw" class="option">인출</li>
									<li data-value="refund" class="option">환불</li>
									<li data-value="complete" class="option">지급</li>
								</ul>
							</div>
						</div>
					</div>

					<table class="table pointTable">
						<thead>
						</thead>
						<tbody>
							<c:forEach var="point" items="${pointList }">
								<tr>
									<td><h4 id="proposal">${point.name }</h4></td>
									<td>
										<div class="point-detail">
											<span class="point-date">${point.datetime }</span><br /> 
											<a href="<%=cp%>/buypostarticle.lion?code=${point.buypost_code}"><span class="buypost-title">${point.buypost_title }</span></a>
										</div>
									</td>
									<td>
										<c:if test="${(point.amount).substring(0,1) == '+' }">
											<span class="point plusPoint">${point.amount }</span>
										</c:if>
										<c:if test="${(point.amount).substring(0,1) == '-' }">
											<span class="point minusPoint">${point.amount }</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
    </section>
    <!-- Featured Section End -->

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