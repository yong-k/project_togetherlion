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
<title>같이사자 신고</title>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" 
			crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style type="text/css">
.sidebar__item ul li:nth-child(2){
	background-color: #f5f3ed;
}
.sidebar__item ul li:nth-child(2) a {
	color: #fc9942;
}
.sidebar__item ul li:nth-child(2) a i {
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
<script>

	var type = '<%=request.getParameter("type")%>';
	var code = '<%=request.getParameter("code")%>';
	
	$(document).ready(function()
    {
		if (type === 'buypost')
		{
			$('h2#buypost').css('display', 'block');
			$('#report-buypost-title').css('display', 'block');
			
			$('h2#reply').css('display', 'none');
			$('#report-reply-content').css('display', 'none');
		}
		else if (type === 'reply')
		{
			$('h2#reply').css('display', 'block');
			$('#report-reply-content').css('display', 'block');
			
			$('h2#buypost').css('display', 'none');
			$('#report-buypost-title').css('display', 'none');
			
		}
		
		let response = '<%=request.getParameter("res")%>';
		if (response === 'ok')
		{
			Swal.fire({
			    	title: '신고가 접수되었습니다.',
			    	icon: 'success',
			    	confirmButtonText: '확인'
			    }).then(() => {
			    	opener.parent.location.reload();
    				window.close();
			    });
		}
		else if (response === 'disable')
		{
			Swal.fire({
		    	title: '신고 처리 중인 컨텐츠 입니다.',
		    	 icon: 'warning',
   			  	iconColor: '#f27474',
		    	confirmButtonText: '확인'
		    }).then(() => {
		    	opener.parent.location.reload();
				window.close();
		    });
		}
		
		
		$('.reportBtn').click(function()
		{
			let cate = $("input[name='main-cate-code']:checked").val();
			if (cate == null)
				alert('항목을 선택해주세요.');
			else
			{
				Swal.fire({
	    			  title: '신고하시겠습니까?',
	    			  text: '신고 후, 취소 불가합니다.',
	    			  icon: 'warning',
	    			  iconColor: '#f27474',
	    			  showCancelButton: true,
	    			  confirmButtonText: '신고',
	    			  cancelButtonText: '취소',
	    			  reverseButtons: true
	    			}).then((result) => {
	    			  if (result.isConfirmed) {
	    				  location.href='insertreportbuypost.lion?type='+type+'&code='+code+'&cate='+cate;
			    	  }
	    			})
			}	
		});
    });
</script>
</head>
<body class="popup">
	<div class="report-container">
		<div class="report-title">
			<h2 id="buypost">공동구매 게시물 신고</h2>
			<h2 id="reply">공동구매 댓글 신고</h2>
			<hr class="report-line"/>
		</div>
		
		<form id="reportForm" action="">
			<div class="report-info">
				작성자 <span class="bar">|</span> ${report.nickname } <br />
				<% 
				String type = request.getParameter("type");
				if (type.equals("buypost"))
				{
				%>					
					<span id="report-buypost-title">제&nbsp;&nbsp;&nbsp;목 <span class="bar">|</span> ${report.title }</span>
				<%
				}
				else
				{
				%>
					<span id="report-reply-content">내&nbsp;&nbsp;&nbsp;용 <span class="bar">|</span> ${report.content }</span>
				<%
				}
				%>
				<hr class="report-line"/>
			</div>
			<div class="accordion" id="accordionExample">
				<c:set var="num" value="0"/>
				<c:forEach var="main" items="${reportMaincateList }">
				<c:set var="num" value="${num+1 }"/>
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading${num }">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapse${num }"
							aria-expanded="true" aria-controls="collapse${num }">
							<input class="form-check-input report-radio" type="radio" name="main-cate-code" value="${main.code }">
							<span class="main-cate">${main.name }</span>
							<i class="fa-solid fa-angle-down report-down"></i>
						</button>
					</h2>
					<div id="collapse${num }" class="accordion-collapse collapse"
						aria-labelledby="heading${num }" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<p class="report-content">
								<c:forEach var="sub" items="${reportSubcateList }">
									<c:if test="${sub.main_cate_code == main.code }">
										- ${sub.name }<br />
									</c:if>
								</c:forEach>
							</p>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			
			<button type="button" class="btn btn-primary lion-primary-btn reportBtn">신고하기</button>
		</form>
	</div>


	<!-- js plugins -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
		integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
		crossorigin="anonymous"></script>
	<script src="<%=cp %>/js/jquery-3.3.1.min.js"></script>
	<script src="<%=cp %>/js/bootstrap.min.js"></script>
	<script src="<%=cp %>/js/jquery.nice-select.min.js"></script>
	<script src="<%=cp %>/js/jquery-ui.min.js"></script>
	<script src="<%=cp %>/js/jquery.slicknav.js"></script>
	<script src="<%=cp %>/js/owl.carousel.min.js"></script>
	<script src="<%=cp %>/js/main.js"></script>
</body>
</html>