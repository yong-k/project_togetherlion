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
	<script src="<%=cp %>/js/paging_noSearching.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
<style type="text/css">
.sidebar__item ul li:nth-child(3) {
	background-color: #f5f3ed;
}
.sidebar__item ul li:nth-child(3) a {
	color: #fc9942;
}
.sidebar__item ul li:nth-child(3) a i {
	color: #fc9942;
}

/* sweetalert */
h2#swal2-title {
    font-size: 23px;
    padding-top: 40px;
    padding-bottom: 10px;
}
input.swal2-input {
    margin-bottom: 10px;
}
input.swal2-input:focus {
    box-shadow: none;
    border: 2px solid #fca652;
}
button.swal2-confirm.swal2-styled {
    background-color: #fca652;
    width: 100px;
    margin-right: 20px;
}
button.swal2-cancel.swal2-styled {
    width: 100px;
    margin-right: 20px;
}
button.swal2-confirm.swal2-styled:focus {
    box-shadow: none;
}
button.swal2-cancel.swal2-styled:focus {
    box-shadow: none;
}
</style>
<script type="text/javascript">

	$(document).ready(function()
    {
		$('.wish-allCheck').click(function()
		{
			if ($(this).is(':checked')) 
				$('.del-check').prop('checked', true);
			else
				$('.del-check').prop('checked', false);
		});
		
		$('.del-check').click(function()
		{
			if ($("input:checkbox[name='wish-check']:checked").length == $("input:checkbox[name='wish-check']").length)
				$('.wish-allCheck').prop('checked', true);
			else
				$('.wish-allCheck').prop('checked', false);
		});
		
		$(".wish-deleteBtn").click(function()
		{
			if ($("input:checkbox[name='wish-check']:checked").length == 0)
			{
				Swal.fire({
		  			  title: '선택 항목이 없습니다.',
		  			  icon: 'warning',
		  			  iconColor: '#f27474',
		  			  confirmButtonText: '확인',
		  			  reverseButtons: true
		  			})
		  			
		  		return;
			}
			
			let value = "";
			$("input:checkbox[name='wish-check']:checked").each(function()
			{
				value += this.value;
			});
			
			Swal.fire({
  			  title: '찜을 삭제하시겠습니까?',
  			  icon: 'warning',
  			  iconColor: '#f27474',
  			  showCancelButton: true,
  			  confirmButtonText: '삭제',
  			  cancelButtonText: '취소',
  			  reverseButtons: true
  			}).then((result) => {
  				if (result.isConfirmed) {
    				  location.href="mypage_deletewish.lion?value="+value;
		    	  }
  			})
		});

    });	
</script>
</head>
<body>

	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
    
    <!-- import Mypage Header -->
	<c:import url="/mypageheader.lion"></c:import>
	
	<!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
			<div class="row featured__filter">

				<!-- import mypage_MENUBAR -->
				<c:import url="/mypagemenubar.lion"></c:import>

				<div class="col-lg-9 col-md-7">
					<div class="product__discount wishlist-titleBox">
						<div class="section-title myBuypost-title">
							<h2>찜</h2>
						</div>
					</div>
					
					<c:choose>
						<c:when test="${hasWishlist == 0 }">
							<div class="row">
								<div class="no-wish"> 
									<i class="fa fa-heart-o buypost-wish mypage-wish" aria-hidden="true"></i>
									<h4>아직 찜한 상품이 없어요</h4>
								</div>
							</div>
						</c:when>
						
						<c:otherwise>
							<form action="">
								<div class="wishlist-box">
									<span class="wish-allCheck-title">전체선택</span>
									<input class="form-check-input wish-allCheck" type="checkbox">
									<button type="button" class="btn btn-primary inquiryBtn wish-deleteBtn">선택삭제</button>
								</div>
								
								<div class="row">
									<c:forEach var="buypost" items="${wishlist }">
										<div class="col-lg-4 col-md-6 col-sm-6">
											<input class="form-check-input del-check" type="checkbox" name="wish-check" value="${buypost.wish_code }">
												
											<div class="featured__item">
						                    	<a href="buypostarticle.lion?code=${buypost.code }">
						                    		<c:choose>
						                    			<c:when test="${Integer.parseInt(buypost.is_blind) < 1 }">
							                        		<div class="featured__item__pic set-bg" data-setbg="img/buypost/${buypost.goods_photo_name }">
							                        	</c:when>
							                        	<c:otherwise>
							                        		<div class="featured__item__pic set-bg" data-setbg="img/blindpost.png">
							                        	</c:otherwise>
							                        </c:choose>
							                        	<c:choose>
							                        		<c:when test="${buypost.left_day < 0 || buypost.left_hour < 0 || buypost.left_minute < 0 }">
							                        			<span class="timeLeft" id="endTime">
							                        				마감
							                        			</span>
							                        		</c:when>
							                        		<c:otherwise>
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
							                        		</c:otherwise>
							                        	</c:choose>
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
							</form>
							
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
						</c:otherwise>
					</c:choose>
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