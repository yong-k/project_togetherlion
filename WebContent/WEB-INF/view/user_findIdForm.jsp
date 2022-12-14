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

	//특수문자 정규식 변수(공백 미포함)
	var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
	
	// 완성형 아닌 한글 정규식
	var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
	
	$().ready(function()
	{
		if ('<%=request.getParameter("errCode")%>' === 'true')
		{
			Swal.fire({
				  icon: 'error',
				  text: '일치하는 회원 정보가 존재하지 않습니다.',
				  confirmButtonText: '확인'
				});
		}
		// 이름 입력한 공백 제거
		$("#name").focusout(function()
		{
			$("#name").val($("#name").val().replaceAll(" ", ""));
		});		
		
		// ID 찾기
		$(".findBtn").click(function()
		{
			$("#nameErrMsg").css("display", "none");
			$("#telErrMsg").css("display", "none");
			$("#findErrMsg").css("display", "none");
			let name = $("#name").val().replaceAll(" ", "");
			$("#name").val(name);
			let tel = $("#tel").val();

			
			if (name == "" || tel == "")
			{
				$("#findErrMsg").css("display", "block");
				return false;
			}
			
			if (name.length > 0)
			{
				if (name.match(replaceChar) || name.match(replaceNotFullKorean) || name.length < 2) 
				{
					$("#nameErrMsg").css("display", "block");
					return false;
				}
			}
			
			if (tel.length < 10)
			{
				$("#telErrMsg").css("display", "block");
				return false;
			}
			
			$("#idFindForm").submit();						
		});
	});
</script>
</head>
<body>
	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
    
    <section class="featured spad">

		<div class="join-title-container">
			<h2 class="findForm-title">아이디 찾기</h2>
			<hr class="findForm-hr"/>
		</div>

		<div class="join-container">
			<form action="<%=cp %>/findid.lion" class="join-form" id="idFindForm" method="post">
				<table class="join-table">
					<thead>
					</thead>
					<tbody>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="name" id="name" placeholder="이름 입력" required="required"/>
								<div class="errMsg" id="nameErrMsg">올바른 이름 형식이 아닙니다.</div>
							</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>
								<input type="text" name="tel" id="tel" placeholder="예) 01012345678" required="required" 
								oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');"
								maxlength="11"/>
								<div class="errMsg" id="telErrMsg">올바른 번호 형식이 아닙니다.</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-primary lion-primary-btn findBtn" >확인</button>
								<div class="errMsg" id="findErrMsg">모든 항목을 입력해주세요.</div>
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