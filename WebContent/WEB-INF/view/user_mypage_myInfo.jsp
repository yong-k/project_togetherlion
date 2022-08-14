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
 
	$(function()
	{
		if ('<%=request.getParameter("errCase")%>' === 'true')
		{
			Swal.fire({
				  text: '현재 비밀번호가 일치하지 않습니다.',
				  icon: 'warning',
				  iconColor: '#f27474',
				  confirmButtonText: '확인'
				})	
		}
		else if ('<%=request.getParameter("update")%>' === 'ok')
		{
			Swal.fire({
				  icon: 'success',
				  title: '회원정보가 수정되었습니다.',
				  confirmButtonText: '확인'
				})
		}
	});

</script>
</head>
<body>

	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
    
    <!-- import Mypage Header -->
	<c:import url="/mypageheader.lion"></c:import>
	
    <section class="featured spad">
        <div class="container">
			<div class="row featured__filter">

				<!-- import mypage_MENUBAR -->
				<c:import url="/mypagemenubar.lion"></c:import>

				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title myInfo-title">
							<h2>개인 정보 수정</h2>
							<hr class="myInfo-hr"/>
						</div>
					</div>

					<form action="<%=cp %>/mypage_myinfoupdate.lion" class="join-form" id="myInfoUpdateForm" method="post">
						<table class="join-table myInfo-table">
							<thead>
							</thead>
							<tbody>
								<tr>
									<th>아이디</th>
									<td>
										<input type="text" name="id" id="id" value="${member.id }" readonly/>
									</td>
								</tr>
								<tr>
									<th>현재 비밀번호</th>
									<td>
										<input type="password" name="nowPw" id="nowPw" placeholder="비밀번호 입력" maxlength="16"/>
									</td>
								</tr>
								<tr>
									<th>새 비밀번호</th>
									<td>
										<input type="password" name="pw" id="pw" placeholder="비밀번호 입력" maxlength="16"/>
										<div class="errMsg" id="pwErrMsg">8~16자(소문자,숫자,특수문자 포함)</div>
									</td>
								</tr>
								<tr>
									<th>새 비밀번호 확인</th>
									<td>
										<input type="password" name="pwCheck" id="pwCheck" placeholder="비밀번호 입력" maxlength="16"/>
										<div class="errMsg" id="pwCheckErrMsg">일치하지 않습니다.</div>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" name="name" id="name" value="${member.name }" readonly />
									</td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td>
										<input type="text" name="tel" id="tel" required="required" value="${member.tel }" placeholder="예) 01012345678" 
										oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');"
										maxlength="11"/>
										<button type="button" class="btn btn-outline-primary join-form-btn"
										id="telAuthBtn">인증번호 전송</button>
										<div class="errMsg" id="telErrMsg">해당 휴대폰 번호로 가입된 아이디가 있습니다.</div>
									</td>
								</tr>
								<tr id="telAuth">
									<th></th>
									<td>
										<input type="text" name="telCheckNum" id="telCheckNum"
										oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');"
										maxlength="6"/>
										<button type="button" class="btn btn-outline-primary join-form-btn"
										id="telAuthCheckBtn">인증번호 확인</button>
									</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>
										<input type="text" name="nickname" id="nickname" value="${member.nickname }" placeholder="닉네임 입력"/>
										<button type="button" class="btn btn-outline-primary join-form-btn" 
										id="nicknameOverlapBtn">중복확인</button>
										<div class="errMsg" id="nicknameErrMsg">중복된 닉네임 입니다.</div>
									</td>
								</tr>
								<tr class="join-agree">
									<td colspan="2" class="myInfo-btn-box">
										<button type="button" class="btn btn-outline-primary login-form-btn myInfo-withdrawBtn"
											onclick="location.href='<%=cp%>/mypage_withdrawnotice.lion'">탈퇴하기</button>
										<button type="button" class="btn btn-primary lion-primary-btn"
										id="myInfoUpdateBtn">회원정보수정</button>
										<div class="errMsg" id="myInfoErrMsg">현재비밀번호와 휴대폰번호는 필수 입력값입니다.</div>
										<input type="hidden" name="member_code" value="<%=session.getAttribute("member_code")%>"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>

				</div>
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
    <script src="<%=cp%>/js/mypage_myInfo.js"></script>
</body>

</html>