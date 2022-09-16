<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String buy_num_str = request.getParameter("buy_num");
	String price_str = request.getParameter("price");
	
	int buy_num = 0, price = 0;
	String amount = null;
	if (buy_num_str != null && price_str != null) 
	{
		buy_num = Integer.parseInt(buy_num_str);
		price = Integer.parseInt(price_str);
		DecimalFormat df = new DecimalFormat("###,###");
		amount = df.format(price * buy_num);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>같이사자 공동구매</title>
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
		let status = '<%=request.getParameter("status")%>';
		if (status === 'participate')
		{
			Swal.fire({
	  			  icon: 'success',
	  			  text: '상품 결제 및 공동구매 참여 처리되었습니다.',
	  			  confirmButtonText: '확인'
	  			}).then(() => {
					opener.parent.location.reload();	  				
	  				window.close();
			    });	
		}
		else if (status === 'add')
		{
			Swal.fire({
	  			  icon: 'success',
	  			  text: '추가 구매가 완료되었습니다.',
	  			  confirmButtonText: '확인'
	  			}).then(() => {
					opener.parent.location.reload();	  				
	  				window.close();
			    });	
		}
		
		// <결제하기> 버튼 클릭 시, 
		$(".buypostPayBtn").click(function()
	   	{
			let btn = '<%=request.getParameter("btn")%>';
			if (btn === 'first')
				$('#buypostPay-form').attr('action', 'insertparticipant.lion');
			else if (btn === 'more')
				$('#buypostPay-form').attr('action', 'updateparticipant.lion');
			
			$('#buypostPay-form').submit();
	    });
    });
	
	// <충전하러 가기> 버튼 클릭 시, 
	function charge()
	{	
		window.open("point_chargeform.lion", "_blank", "top=150,left=550,width=505,height=685");
	}
</script>
</head>
<body class="popup">
	<%
	if (buy_num_str != null && price_str != null)
	{
	%>
	<div class="report-container">
		<div class="report-title">
			<% 
			if (request.getParameter("type").equals("host")) {
			%>
			<h2 class="hostMsg">공동구매 진행 결제창</h2>
			<%
			} else if (request.getParameter("type").equals("participant")) {
			%>
			<h2 class="participantMsg">공동구매 참여 결제창</h2>
			<%
			}
			%>
			<hr class="report-line"/>
		</div>
		
		<form action="" id="buypostPay-form">
			<table class="table buypostPayTable">
				<thead></thead>
				<tbody>
					<tr>
						<th colspan="2">
							<%
							if (request.getParameter("type").equals("host")) {
							%>
							<h4 class="hostMsg">포인트 결제 후, 공동구매 진행이 시작됩니다.</h4>
							<%
							} else if (request.getParameter("type").equals("participant")) {
							%>
							<h4 class="participantMsg">포인트 결제 후, 공동구매 참여가 완료됩니다.</h4>
							<%
							}
							%>						
						</th>
					</tr>
					<tr>
						<th>구매 수량</th>
						<td class="number">
							<input type="text" name="buy_number" class="pay-txtbox" value="<%=buy_num %>">
						</td>
					</tr>
					<tr>
						<th>잔여 포인트</th>
						<td class="number">${pointAmount }</td>
					</tr>
					<tr>
						<th>결제 포인트</th>
						
						<td class="number">
							<input type="text" name="amount" class="pay-txtbox" value="<%=amount%>">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="notice">
							<%
							if (request.getParameter("type").equals("host")) {
							%>
							<span class="payNotice hostMsg">* 참여자가 내용 수정이 불가합니다. (진행 취소 후 재작성)</span><br />
							<span class="payNotice hostMsg">* 진행 취소 시, 포인트는 환불 처리됩니다.</span><br />
							<span class="payNotice hostMsg">* 공동구매 마감 24시간 전에는 수정 및 취소 불가합니다.</span>
							<%
							} else if (request.getParameter("type").equals("participant")) {
							%>
							<span class="payNotice participantMsg">* 참여 취소 시, 포인트는 환불 처리됩니다.</span><br />
							<span class="payNotice participantMsg">* 공동구매 마감 24시간 전에는 취소 불가합니다.</span>
							<%
							}
							%>	
						</td>
					</tr>
				</tbody>
			</table>
			
			<c:set var="amount" value="<%=Integer.parseInt(amount.replaceAll(\",\", \"\")) %>" />
			<c:set var="pointAmount" value="${Integer.parseInt(pointAmount.replaceAll(',', '')) }" />
			<c:choose>
				<c:when test='${pointAmount >= amount }'>
					<button type="button" class="btn btn-primary lion-primary-btn popupBtn buypostPayBtn">결제하기</button>
					<input type="hidden" name="buypost_code" value="<%=request.getParameter("buypost_code") %>">
					<input type="hidden" name="member_code" value="${member_code }">
					<input type="hidden" name="btn" value="<%=request.getParameter("btn") %>">
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-primary lion-primary-btn popupBtn linkPayToChargeBtn"
					onclick="javascript:charge()">
						포인트가 부족합니다. <br />
						포인트 충전하러 가기 Click!				
					</button>
				</c:otherwise>
			</c:choose>
		</form>
		<hr class="report-line"/>
	</div>

	<%
	}
	%>
	
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