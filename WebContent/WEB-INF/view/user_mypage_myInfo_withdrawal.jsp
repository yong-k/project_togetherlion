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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
<style type="text/css">
.sidebar__item ul li:last-child {
	background-color: #f5f3ed;
}
.sidebar__item ul li:last-child a {
	color: #fc9942;
}
.sidebar__item ul li:last-child a i {
	color: #fc9942;
}

/* sweetalert */
button.swal2-confirm.swal2-styled {
    background-color: #fca652;
    width: 100px;
}
button.swal2-cancel.swal2-styled {
    width: 100px;
}
button.swal2-confirm.swal2-styled:focus {
    box-shadow: none;
}
</style>
<script type="text/javascript">

	$(function()
    {
		if ('<%=request.getParameter("errCase")%>' === 'true')
		{
			Swal.fire({
				  text: '비밀번호가 일치하지 않습니다.',
				  icon: 'warning',
				  iconColor: '#f27474',
				  confirmButtonText: '확인'
				})	
		}
    });	
	
</script>
</head>
<body>
	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
    
    <section class="featured spad">

		<div class="join-title-container">
			<h2 class="join-title">회원 탈퇴 안내</h2>
			<hr class="withdrawal-hr"/>
		</div>

		<div class="join-container">
			<form action="<%=cp %>/mypage_memberwithdraw.lion" class="join-form">
				<table class="join-table">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td colspan="2">
								<h4 class="withdraw-text-title">탈퇴 유의사항</h4>
								<hr />
								<p>1. 회원탈퇴 시 보유 포인트는 모두 삭제되며, 환급 불가능합니다.</p>
								<p>2. 게시물, 댓글 등의 데이터는 삭제되지 않습니다.</p>
								<hr />
							</td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td>
								<input type="password" name="pw" id="pw" placeholder="비밀번호 입력" required="required"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-outline-primary login-form-btn myInfo-cancelBtn"
										onclick="location.href='<%=cp%>/mypage_myinfoupdateform.lion'">취소</button>
								<button type="submit" class="btn btn-primary lion-primary-btn myInfo-withdrawBtn">탈퇴</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</section>

	<!-- import FOOTER -->
	<c:import url="/footer.lion"></c:import>
 
    <!-- js plugins -->
    <script src="<%=cp%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=cp %>/js/bootstrap.min.js"></script>
    <script src="<%=cp %>/js/jquery.nice-select.min.js"></script>
    <script src="<%=cp %>/js/jquery-ui.min.js"></script>
    <script src="<%=cp %>/js/jquery.slicknav.js"></script>
    <script src="<%=cp %>/js/owl.carousel.min.js"></script>
    <script src="<%=cp %>/js/main.js"></script>
</body>
</html>