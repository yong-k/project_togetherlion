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
h2#swal2-title {
    font-size: 23px;
    padding-bottom: 10px;
}
button.swal2-confirm.swal2-styled {
    background-color: #fca652;
    width: 120px;
    margin-top: -12px;
}
button.swal2-confirm.swal2-styled:focus {
    box-shadow: none;
}
table.ban-info tbody tr td {
    text-align: left !important;
}
</style>
<script type="text/javascript">

	$().ready(function()
	{
		let member_code = '<%=(String)session.getAttribute("member_code")%>';
		let urlParams = new URLSearchParams(location.search);
		let errCase = urlParams.get("errCase");
		let banReason = urlParams.get("banReason");
		let banType = urlParams.get("banType");
		if (banType === 'article')
			banType = '공동구매 게시물 신고';
		else if (banType === 'reply')
			banType = '공동구매 댓글 신고';

		if (member_code === 'null')
		{
			// 영구정지 회원일 때,
			if (errCase === '1')
			{
				Swal.fire({
					  title: '영구정지 안내\n\n제한사유: '+ banType + '\n상세내용: '+ banReason,
					  text: '참여/진행 중인 공동구매는 모두 취소처리 됩니다.',
					  icon: 'warning',
					  iconColor: '#f27474',
					  confirmButtonText: '확인',
					})					
			}
			// 아이디 또는 비밀번호가 일치하지 않을 때,
			else if (errCase === '2')
			{
				Swal.fire({
					  title: '아이디 또는 비밀번호를 확인해주세요.',
					  icon: 'warning',
					  iconColor: '#f27474',
					  confirmButtonText: '확인'
					})					
			}
			// 비밀번호찾기 완료 후,
			else if ('<%=request.getParameter("code")%>' === 'true')
			{
				Swal.fire({
					  icon: 'success',
					  title: '비밀번호가 변경되었습니다.',
					  confirmButtonText: '확인'
					});
			}
		}
		
		// <로그인> 버튼 클릭 시,
		$("#loginBtn").click(function()
		{
			if ($("#id").val() == "" || $("#pw").val() == "")
			{
				Swal.fire({
					  title: '아이디/비밀번호를 모두 입력해주세요.',
					  icon: 'warning',
					  iconColor: '#f27474',
					  confirmButtonText: '확인'
					})						
				return;
			}
			else
			{
				// @ 있으면 회원테이블 scan, 없으면 관리자테이블 scan
				if (($("#id").val()).indexOf("@") !== -1)
					$("#loginForm").attr("action", "loginmember.lion");
				else
					$("#loginForm").attr("action", "loginadmin.lion");
				
				$("#loginForm").submit();
			}
		});
	})
</script> 
</head>
<body>
	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
     
    <section class="featured spad">
        <div class="container login-container">
			<div class="login">
				<h3 class="title">로그인</h3>

				<form action="" class="login-form" id="loginForm" method="post">
					<div class="form-group">
						<input type="email" id="id" name="id" class="form-control login-form-control" placeholder="이메일 입력">
					</div>
					<div class="form-group">
						<input type="password" id="pw" name="pw" class="form-control login-form-control" placeholder="비밀번호 입력">
					</div>
					<div class="login-search-box">
						<div class="login-search">
							<a href="<%=cp%>/findidform.lion">아이디 찾기</a> | 
							<a href="<%=cp%>/findpwform.lion">비밀번호 찾기</a>
						</div>
					</div>
					<button type="button" class="btn btn-primary login-form-btn"
					id="loginBtn">로그인</button>
				</form>
				<button type="button" class="btn btn-outline-primary login-form-btn"
				onclick="location.href='<%=cp%>/joinform.lion'">회원가입</button>
			</div>
        </div>
    </section>

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