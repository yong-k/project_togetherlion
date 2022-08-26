<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>admin같이사자</title>

<link href="<%=cp %>/css/adminStyle.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- 
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
<script src="<%=cp %>/js/scripts.js"></script>

<style type="text/css">
.sb-sidenav-menu a.current-menu {
    background-color: #f5f4f2;
    color: #fca652 !important;
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
	
	$(document).ready(function()
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
		else if ('<%=request.getParameter("updateCheck")%>' === 'ok')
		{
			Swal.fire({
			    	title: '수정 완료!',
			    	icon: 'success',
			    	confirmButtonText: '확인'
			    });
		}

    	$(".cancelBtn").click(function()
		{
    		Swal.fire({
    			  title: '그만하고 목록으로 돌아가시겠습니까?',
    			  icon: 'warning',
    			  iconColor: '#f27474',
    			  showCancelButton: true,
    			  confirmButtonText: '목록으로',
    			  cancelButtonText: '취소',
    			  reverseButtons: true
    			}).then((result) => {
    					if (result.isConfirmed)
  			    		location.href = 'admin_accountlist.lion';
  			    });
		});

    });
	
</script>
</head>
<body class="sb-nav-fixed">

	<!-- import HEADER -->
	<c:import url="/adminheader.lion"></c:import>

	<div id="layoutSidenav">

		<!-- menubar -->
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">MENU</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#member" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-user icon"></i>
							</div> 회원조회
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="member" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_memberall.lion">전체회원</a> 
								<a class="nav-link" href="<%=cp %>/admin_memberban.lion">영구정지회원</a> 
								<a class="nav-link" href="<%=cp %>/admin_memberwithdrawal.lion">탈퇴회원</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#point" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-sack-dollar icon"></i>
							</div> 포인트조회
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="point" aria-labelledby="headingTwo"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_pointcharge.lion">포인트충전</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointpay.lion">포인트결제</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointrefund.lion">포인트환불</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointwithdraw.lion">포인트인출</a> 
								<a class="nav-link" href="<%=cp %>/admin_pointcomplete.lion">완료포인트지급</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#homepage" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-landmark icon"></i>
							</div> 홈페이지관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="homepage" aria-labelledby="headingThree"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_noticelist.lion">공지사항</a> 
								<a class="nav-link" href="<%=cp %>/admin_categorylist.lion">카테고리</a> 
								<a class="nav-link" href="<%=cp %>/admin_mannerlist.lion">매너지수</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#cancel" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-circle-xmark icon"></i>
							</div> 미진행취소
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="cancel"
							aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_cancelreceptionlist.lion">접수내역</a>
								<a class="nav-link" href="<%=cp %>/admin_cancelhandlinglist.lion">처리내역</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#report" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-triangle-exclamation icon"></i>
							</div> 신고관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="report" aria-labelledby="headingFive"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_reportreceptionlist.lion">접수내역</a> 
								<a class="nav-link" href="<%=cp %>/admin_reporthandlinglist.lion">처리내역</a> 
								<a class="nav-link" href="<%=cp %>/admin_reportreasonlist.lion">사유관리</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#inquiry" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-circle-question icon"></i>
							</div> 문의관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="inquiry" aria-labelledby="headingSix"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=cp %>/admin_inquirylist.lion">1:1문의</a> 
								<a class="nav-link" href="<%=cp %>/admin_faqlist.lion">FAQ</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">ADMIN ACCOUNT</div>
						<a class="nav-link current-menu" href="<%=cp %>/admin_accountlist.lion">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-gears icon"></i>
							</div> 관리자계정관리
						</a>
					</div>
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4">

						<!--  Breadcrumb -->
						<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">관리자계정관리</li>
								<li class="breadcrumb-item active" aria-current="page"><a
									href="#">계정목록</a></li>
							</ol>
						</nav>

						<div class="card-body">
							<div class="account-container">
								<h2 class="head">관리자계정 수정</h2>
								
								<div class="accountForm-box">
									<form action="<%=cp %>/admin_accountupdate.lion" method="post" id="accountUpdateForm">
										<div class="form-floating mb-3">
											<input type="text" name="id" id="id" class="form-control adminAccount-form adminUpdate-readonly" 
											placeholder="ID" value="${admin.id }" readonly>
											<label for="floatingId">아이디</label>
										</div>
										<div class="form-floating mb-3">
											<input type="password" name="nowPw" id="nowPw" class="form-control adminAccount-form" 
											placeholder="Password" maxlength="16">
											<label for="floatingPassword">현재 비밀번호</label>
										</div>
										<div class="form-floating mb-3">
											<input type="password" name="pw" id="pw" class="form-control adminAccount-form" 
											placeholder="Password" maxlength="16">
											<label for="floatingPassword">새 비밀번호</label>
											<div class="errMsg" id="pwErrMsg">8~16자(소문자,숫자,특수문자 포함)</div>
										</div>
										<div class="form-floating mb-3">
											<input type="password" name="pwCheck" id="pwCheck" class="form-control adminAccount-form" 
											placeholder="Password" maxlength="16"> 
											<label for="floatingPassword">새 비밀번호 확인</label>
											<div class="errMsg" id="pwCheckErrMsg">일치하지 않습니다.</div>
										</div>
										<div class="form-floating mb-3">
											<input type="text"  name="name" id="name" class="form-control adminAccount-form adminUpdate-readonly" 
											placeholder="Name" value="${admin.name }" readonly>
											<label for="floatingName">이름</label>
										</div>
										<div class="form-floating mb-3">
											<input type="tel" name="tel" id="tel" class="form-control adminAccount-form" 
											placeholder="Tel" maxlength="11" value="${admin.tel }" 
											oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');">>
											<label for="floatingTel">휴대전화</label>
											<button type="button" class="adminBtn accountBtn" id="telAuthBtn">인증번호 전송</button>
											<div class="errMsg" id="telErrMsg">해당 휴대폰 번호로 가입된 아이디가 있습니다.</div>
										</div>
										<div class="form-floating mb-3" id="telAuth">
											<input type="text" name="telCheckNum" id="telCheckNum" class="form-control adminAccount-form" 
											placeholder="TelNum" maxlength="6"
											oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');">
											<label for="floatingTelNum">인증번호 입력</label>
											<button type="button" class="adminBtn accountBtn" id="telAuthCheckBtn">확인</button>
										</div>
									</form>
								</div>
							</div>
							<div class="btn-container notice-btn">
								<button type="button" class="adminBtn cancelBtn answerCancelBtn">취소</button>
								<button type="button" class="adminBtn saveBtn answerInsertBtn">계정 수정</button>
								<div class="errMsg" id="myInfoErrMsg">현재비밀번호와 휴대폰번호는 필수 입력값입니다.</div>
							</div>
						</div>

					</div>
				</div>
			</main>

			<!-- import FOOTER -->
			<c:import url="/adminfooter.lion"></c:import>

		</div>
	</div>

	<!-- js plugins -->
	<script src="<%=cp %>/js/admin_accountUpdateForm.js"></script>	
</body>
</html>
