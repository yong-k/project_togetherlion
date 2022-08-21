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
<title>같이사자 계좌등록</title>
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
		var bank_code;
		var accountLength;
		
		if ('<%=request.getParameter("code")%>' === 'true') 
		{
			Swal.fire({
    			icon: 'success',
    			title: '계좌가 등록되었습니다.',
    			confirmButtonText: '확인'
    		}).then(() => {
			    	window.close();
			    });	
		}
		
		$('.bank-select').on("change", function()
		{
			$('#accountErrMsg').css('display', 'none');
			arr = $(this).val().split(',');
			bank_code = arr[0];
			accountLength = Number(arr[1]);
			$('#account_number').val('');
			$('#account_number').attr('maxlength', accountLength);
		});
		
		$('.accountInsertBtn').click(function()
		{
			$('#accountErrMsg').css('display', 'none');
			
			if ($('#account_number').val().length != accountLength) {
				$('#accountErrMsg').css('display', 'block');
				$('#account_number').focus();
				return false;
			}
			
			$('#bank_code').val(bank_code);
			$('#accountInsertForm').submit();
		});
    });

</script>
</head>
<body class="popup">
	<div class="report-container">
		<div class="report-title">
			<h2>계좌 등록</h2>
			<p class="account-text">처음 계좌 등록 시, 자동으로 대표계좌로 등록됩니다. (대표계좌는 삭제 불가)</p> 
			<hr class="report-line"/>
		</div>
		
		<form action="<%=cp%>/point_accountinsert.lion" id="accountInsertForm">
			<table class="table accountTable accountInsertTable">
				<thead></thead>
				<tbody>
					<tr>
						<th>은행 선택</th>
						<td>   
							<select class="form-select bank-select" aria-label="Default select example">
								<option value="0" selected>--선택--</option>
								<c:forEach var="bank" items="${bankList }">
									<option value="${bank.code },${bank.digit}">${bank.name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td>
							<input type="text" id="account_number" name="account_number" 
							class="accountNum" placeholder="'-' 없이 입력하세요."
							oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '&1');"/>
							<div class="errMsg" id="accountErrMsg">유효하지 않은 계좌번호입니다.</div>
							<div class="accountInsert-notice">본인 명의 계좌만 등록 가능합니다.</div>
						</td>
					</tr>
				</tbody>
			</table>
			<button type="button" class="btn btn-primary lion-primary-btn accountInsertBtn">계좌 등록</button>
			<input type="hidden" id="bank_code" name="bank_code"/>
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