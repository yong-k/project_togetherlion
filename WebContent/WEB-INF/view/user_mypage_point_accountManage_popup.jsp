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
<title>같이사자 계좌관리</title>
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
		if ('<%=request.getParameter("updateCode")%>' === 'true')
		{
			Swal.fire({
    			icon: 'success',
    			title: '대표계좌 설정이 완료되었습니다.',
    			confirmButtonText: '확인'
    		});
		}
		else if ('<%=request.getParameter("deleteCode")%>' === 'true')
		{
			Swal.fire({
    			icon: 'success',
    			title: '계좌가 삭제되었습니다.',
    			confirmButtonText: '확인'
    		});
		}
		
		// <대표계좌로 설정> 버튼 클릭 시,
		$('.mainAccount-setBtn').click(function()
		{
			location.href = 'point_updatemainaccount.lion?code=' + $(this).val();
		});
		
		// <삭제> 버튼 클릭 시, 
		$('.account-deleteBtn').click(function()
		{
			Swal.fire({
				title: '계좌를 삭제하시겠습니까?',
    			icon: 'warning',
    			iconColor: '#f27474',
    			showConfirmButton: true,
    			showCancelButton: true,
    			confirmButtonText: '삭제',
    			cancelButtonText: '취소',
    			reverseButtons: true
    		}).then((result) => {
  					if (result.isConfirmed)
  						location.href = 'point_deleteaccount.lion?code=' + $(this).val();
			    });
		});
    });
	
	// <계좌등록> 버튼 클릭 시, 
	function accountInsertForm() 
	{
		location.href="point_accountinsertform.lion";
	}
</script>
</head>
<body class="popup">
	<div class="report-container">
		<div class="report-title">
			<h2>계좌 관리</h2>
			<p class="account-text">처음 계좌 등록 시, 자동으로 대표계좌로 등록됩니다. (대표계좌는 삭제 불가)<br />
			대표계좌는 해제할 수 없으며, 다른 계좌를 대표계좌로 설정 시 자동으로 변경됩니다.</p> 
			<hr class="report-line"/>
		</div>
		
		<table class="table accountTable">
			<thead></thead>
			<tbody>
				<c:forEach var="account" items="${accountList }">
					<tr>
						<td>
							<div class="bankName">${account.bank_name }</div>
							<div class="accountNum">${account.account_number }</div>
						</td>
						<td>
							<c:choose>
								<c:when test="${account.is_main_account == 1 }">
									<button type="button" class="btn accountManage-btn" disabled>대표계좌</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn accountManage-btn mainAccount-setBtn"
									value="${account.code }">대표계좌로 설정</button>
									<button type="button" class="btn accountManage-btn account-deleteBtn" 
									value="${account.code }">삭제</button>
							 	</c:otherwise>
							 </c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			
		<button type="button" class="btn btn-primary lion-primary-btn accountInsertBtn"
		onclick="javascript:accountInsertForm()">
			<i class="bi bi-plus account-plus"></i>계좌 등록
		</button>
		<hr class="report-line"/>
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