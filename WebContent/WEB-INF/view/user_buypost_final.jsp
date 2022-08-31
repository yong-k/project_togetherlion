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
</head>
<body>

	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>

	<!-- 메인말고는 상품 한 페이지에 24개 --> 
	<section class="breadcrumb-section set-bg finalBuyPost-banner"
		data-setbg="<%=cp %>/img/hero/banner4.jpg">
			
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>마감임박</h2>
                    </div>
                </div>
            </div>
        </div>	
	</section>

	<!-- Product Section Begin -->
	<section class="feature spad">
		<div class="container">
			<div class="row featured__filter">
				<div class="col-lg-12 col-md-12">
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>카테고리 선택</span> <select>
										<option value="0">전체</option>
										<option value="1">쌀/면/빵/떡</option>
										<option value="2">과일/채소</option>
										<option value="3">수산/정육/계란</option>
										<option value="4">밀키트/간편식/냉동</option>
										<option value="5">국/반찬</option>
										<option value="6">간식/과자</option>
										<option value="7">우유/유제품</option>
										<option value="8">물/음료/커피/차</option>
										<option value="9">양념/소스</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<c:forEach var="buypost" items="${buypostList }" >
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">    
	                	<a href="buypostarticle.lion?code=${buypost.code }">            	
		                    <div class="featured__item">
		                        <div class="featured__item__pic set-bg" data-setbg="img/buypost/${buypost.goods_photo_name }">
		                        	<span class="timeLeft">
		                        	<c:choose>
		                        		<c:when test="${buypost.left_day != '0'}">	
		                        			${buypost.left_day }일 남음
		                        		</c:when>
		                        		<c:otherwise>
		                        			${buypost.left_hour }시간 ${buypost.left_minute }분 남음
		                        		</c:otherwise>
		                        	</c:choose>
									</span>
		                        	<span class="featured__item__pic__hover">
		                        		<i class="bi bi-cart4"></i>
		                        		<span class="item_number">${buypost.count }</span>
		                        	</span>
		                        </div>
	                        </a>
	                        <div class="featured__item__text">
	                            <h6><a href="buypostarticle.lion?code=${buypost.code }">${buypost.title }</a></h6>
	                            <h5>￦${buypost.amount }</h5>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
			</div>

			<!-- page navigation -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${pagination.prev }">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous"
							onclick="fn_prev('${pagination.page }', '${pagination.range }', '${pagination.rangeSize }')"> 
							<span aria-hidden="true">&laquo;</span></a>
						</li>
					</c:if>
					<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
						<li class="page-item <c:out value="${pagination.page == idx ? 'active' : '' }"/>">
							<a class="page-link" href="#" 
							onclick="fn_pagination('${idx}', '${pagination.range }', '${pagination.rangeSize }')"> ${idx } </a>
						</li>
					</c:forEach>
					<c:if test="${pagination.next }">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next"
							onclick="fn_next('${pagination.page}', '${pagination.range }', '${pagination.rangeSize }')"> 
							<span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</section>
	<!-- Product Section End -->

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