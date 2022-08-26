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
<title>같이사자 포인트 인출</title>
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
		if ('<%=request.getParameter("code")%>' === 'true')
		{
			Swal.fire({
    			icon: 'success',
    			title: '인출이 완료되었습니다.',
    			confirmButtonText: '확인'
    		}).then(() => {
    				opener.parent.location.reload();
    				window.close();
			    });
		}
		
		let point = '${point }';
		point = point.replaceAll(',', '');
		
		$('#amount').focusout(function()
		{
			if (Number($('#amount').val()) > Number(point))
			{
				$('#withdrawPointErrMsg').css('display', 'none');
				$('#amount').val(point);
			}
		});
		
		$(".point-withdrawBtn").click(function()
		{
			$('#withdrawPointErrMsg').css('display', 'none');
			$('#withdrawAccountErrMsg').css('display', 'none');
			
			
			if ($('#amount').val() === null || $('#amount').val() === '' || Number($('#amount').val()) > Number(point))
			{
				$('#withdrawPointErrMsg').css('display', 'block');
				$('#amount').focus();
				return false;
			}
			if ($('#account-select').val() === '0')
			{
				$('#withdrawAccountErrMsg').css('display', 'block');
				return false;
			}
			
			$('#pointWithdrawForm').submit();
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
			<h2>포인트 인출</h2>
			<hr class="report-line"/>
		</div>
		
		<form id="pointWithdrawForm" action="<%=cp%>/point_withdraw.lion">
			<table class="table accountTable accountInsertTable pointWithdrawTable">
				<thead></thead>
				<tbody>
					<tr>
						<th>인출 가능 포인트</th>
						<td><span class="userPoint">${point }</span> 원</td>
					</tr>
					<tr>
						<th>인출할 포인트</th>
						<td>
							<input type="text" id="amount" name="amount" class="withdrawPoint" 
							placeholder="본인 명의 계좌만 인출가능"
							oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');"/>
							<div class="errMsg" id="withdrawPointErrMsg">인출 금액을 확인해주세요.</div>
						</td>
					</tr>
					<tr>
						<th>인출 계좌</th>
						<td>   
							<select id="account-select" name="account_code" class="form-select bank-select withdrawAccount-select" aria-label="Default select example">
								<option value="0" selected>------- 계좌를 선택해주세요 -------</option>
								<c:forEach var="account" items="${accountList }">
									<c:choose>
										<c:when test="${account.is_main_account == 1 }">
											<option value="${account.code }" selected>${account.bank_name } ${account.account_number }</option>
										</c:when>
										<c:otherwise>
											<option value="${account.code }">${account.bank_name } ${account.account_number }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		    <div class="errMsg" id="withdrawAccountErrMsg">출금 계좌를 선택해주세요.</div>
			
			<button type="button" class="btn accountManage-btn charge-accountInsertBtn"
			onclick="javascript:accountInsertForm()">
				<i class="bi bi-plus account-plus"></i>계좌 등록
			</button>
			<button type="button" class="btn btn-primary lion-primary-btn point-withdrawBtn">인출하기</button>
		</form>
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