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
    padding-top: 40px;
    padding-bottom: 10px;
}
button.swal2-confirm.swal2-styled {
    background-color: #fca652;
    width: 200px;
    height: 50px;
    font-size: 19px;
}
button.swal2-confirm.swal2-styled:focus {
    box-shadow: none;
}
div#swal2-html-container {
    text-align: inherit;
    font-size: 16px;
}
</style>
<script type="text/javascript">

	var joinCheck = Number('<%=request.getParameter("joinCheck")%>');
	
	$().ready(function()
	{
		if (joinCheck > 0)
		{
			Swal.fire({
				  icon: 'success',
				  title: '회원가입이 완료되었습니다.',
				  confirmButtonText: '확인'
				}).then(() => {
			    	location.href='main.lion';
			    });
		}
	});
</script>
</head>
<body>
	<!-- import HEADER -->
	<c:import url="/header.lion"></c:import>
    
    <section class="featured spad">

		<div class="join-title-container">
			<h2 class="join-title">회원가입</h2>
			<div class="join-info"><span class="required">*</span>필수입력사항</div>
			<hr class="join-hr"/>
		</div>

		<div class="join-container">
			<form action="<%=cp %>/joininsert.lion" class="join-form" id="joinForm">
				<table class="join-table">
					<thead>
					</thead>
					<tbody>
						<tr>
							<th>아이디<span class="required">*</span></th>
							<td>
								<input type="text" name="id" id="id" placeholder="예) togetherlion@lion.com" required="required"/>
								<button type="button" class="btn btn-outline-primary join-form-btn" 
								id="idOverlapBtn">중복확인</button>
								<div class="errMsg" id="idErrMsg">중복된 아이디 입니다.</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호<span class="required">*</span></th>
							<td>
								<input type="password" name="pw" id="pw" placeholder="비밀번호 입력" required="required"
								maxlength="16"/>
								<div class="errMsg" id="pwErrMsg">일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호확인<span class="required">*</span></th>
							<td>
								<input type="password" name="pwCheck" id="pwCheck" placeholder="비밀번호 입력" required="required"
								maxlength="16"/>
								<div class="errMsg" id="pwCheckErrMsg">일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<th>이름<span class="required">*</span></th>
							<td>
								<input type="text" name="name" id="name" placeholder="이름 입력" required="required"/>
								<div class="errMsg" id="nameErrMsg">올바른 이름 형식이 아닙니다.</div>
							</td>
						</tr>
						<tr>
							<th>휴대폰<span class="required">*</span></th>
							<td>
								<input type="tel" name="tel" id="tel" placeholder="예) 01012345678" required="required"
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
								<input type="text" name="telCheckNum" id="telCheckNum" required="required" 
								oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');"
								maxlength="6"/>
								<button type="button" class="btn btn-outline-primary join-form-btn"
								id="telAuthCheckBtn">인증번호 확인</button>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"/>
								<button type="button" class="btn btn-outline-primary join-form-btn" 
								id="nicknameOverlapBtn">중복확인</button>
								<div class="errMsg" id="nicknameErrMsg">중복된 닉네임 입니다.</div>
							</td>
						</tr>
						<tr class="join-agree">
							<th>이용약관동의<span class="required">*</span></th>
							<td>
								<div><input class="form-check-input join-checkbox join-allCheck" type="checkbox" name="join-check" value=""><span class="join-text">전체 동의합니다.</span></div>
								<div>
									<input class="form-check-input join-checkbox check-require" type="checkbox" name="join-check" value="">
									<span class="join-text">[필수] 이용약관 동의에 동의합니다.</span>
									<a href="#!"><span class="see-detail see-termsOfService">약관보기<i class="bi bi-chevron-right join-arrow"></i></span></a>
								</div>
								<div>
									<input class="form-check-input join-checkbox check-require" type="checkbox" name="join-check" value="">
									<span class="join-text">[필수] 개인정보 수집 및 이용에 동의합니다.</span>
									<a href="#!"><span class="see-detail see-privacyPolicy">약관보기<i class="bi bi-chevron-right join-arrow"></i></span></a>
								</div>
								<div>
									<input class="form-check-input join-checkbox" type="checkbox" name="join-check" value="">
									<span class="join-text">[선택] 개인정보 수집 및 이용에 동의합니다.</span>
									<a href="#!"><span class="see-detail see-privacyPolicy-choice">약관보기<i class="bi bi-chevron-right join-arrow"></i></span></a>
								</div>
								<div class="last-join-check"><input class="form-check-input join-checkbox check-require" type="checkbox" name="join-check" value=""><span class="join-text">[필수] 본인은 만 14세 이상입니다.</span></div>
								<div class="errMsg" id="agreeErrMsg">필수 약관에 동의해주세요.</div>
							</td>
						</tr>
						<tr class="join-agree">
							<td colspan="2">
								<button type="button" class="btn btn-primary inquiryBtn joinBtn">가입하기</button>
								<div class="errMsg" id="joinErrMsg">*필수 항목을 모두 입력해주세요.<br/>
								중복확인 및 휴대폰인증을 모두 진행해야 합니다.</div>
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
    <script src="<%=cp%>/js/joinForm.js"></script>
</body>
</html>