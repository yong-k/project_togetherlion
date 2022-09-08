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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
/* sweetalert */
button.swal2-confirm.swal2-styled {
    background-color: #fca652;
    width: 100px;
    margin-right: 20px;
}
button.swal2-confirm.swal2-styled:focus {
    box-shadow: none;
}
div#swal2-html-container {
    font-weight: bold;
}
</style>
<script type="text/javascript">

	$(function()
	{
		if ('<%=request.getParameter("code")%>' === 'withdraw')
		{
			Swal.fire({
  			  icon: 'success',
  			  html: '회원탈퇴가 정상적으로 처리되었습니다.<br><br>그동안 이용해주셔서 감사합니다.',
  			  confirmButtonText: '확인'
  			});

		}
	});
	
	function map()
	{
		window.open("map_main.lion", "_blank", "top=150,left=550,width=1000,height=700");
	}
	
</script>
</head>
<body>
	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
    
    <!-- BANNER IMAGE -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" data-interval="4500">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item banner1 active"></div>
			<div class="carousel-item banner2"></div>
			<div class="carousel-item banner3"></div>
			<div class="carousel-item banner4"></div>
			<div class="carousel-item banner5"></div>
			<div class="carousel-item banner6"></div>
			<div class="carousel-item banner7"></div>
		</div>
		
		<div class="hero__search map__search">
			<div class="hero__search__form map__search__form">
				<a href="javascript:map()">
					<form action="#">
						<i class="bi bi-geo-alt-fill" title="지도에서 선택하기"></i>
						<input type="text" class="map__search__text" placeholder="장소를 선택해주세요." readonly>
						<input type="hidden" id="region" readonly>
					</form>
				</a>
			</div>
		</div>
		
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next"
			href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row featured__filter">
            
				<c:forEach var="buypost" items="${buypostList }" >
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">    
	                    <div class="featured__item">
	                    	<a href="buypostarticle.lion?code=${buypost.code }">
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