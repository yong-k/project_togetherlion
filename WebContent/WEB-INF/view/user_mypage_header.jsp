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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>	
<script type="text/javascript">
	$(function()
	{
		$(".mypage-manner-icon").mouseenter(function()
		{
			$("div.mannerLevel-text").css("display", "block");
		});
		
		$(".mypage-manner-icon").mouseleave(function()
		{
			$("div.mannerLevel-text").css("display", "none");
		});
	});
</script>	 
</head>
<body>

    <!-- Mypage Header -->
	<div class="hero__item set-bg mypage-header">
		<div class="mypage-box-container">
			<div class="mypage-header-userBox">
				<div class="mypage-profile-photo">
					<img src="img/mannerLevel/${member.photo_name}" class="mannerLevel-photo">
				</div>
				<div class="mypage-info-box">
					<div class="buypost_profile_nickname participate-profile-nickname">${member.nickname } 님</div>
					<h4 class="header-title-mannerLevel">매너지수<span id="score">${member.score } 점</span></h4>
					<div class="progress mypage-manner-progress">
						<div class="progress-bar bg-warning" role="progressbar" style="width: ${member.score}%" aria-valuenow="${member.score }" 
						aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<i class="bi bi-question-circle mypage-manner-icon"></i>
				</div>
			</div>
			<a href="<%=cp%>/mypage_point.lion">
				<div class="mypage-header-box">
					<h4 class="header-title-point">포인트<i class="bi bi-chevron-right mypage-header-icon"></i></h4>
					<h2 class="pointAmount">${point } 원</h2>
				</div>
			</a>
			<div class="mannerLevel-text">
				매너지수는 공동구매 관련 같이사자 활동지수를 종합한 것입니다.<br />
				<div class="manner-box">
					<img class="manner-photo" src="<%=cp %>/img/mannerLevel/manner_1.png">
					<span class="manner-explain">0 ~ 19 점</span>
				</div>
				<div class="manner-box">
					<img class="manner-photo" src="<%=cp %>/img/mannerLevel/manner_2.png">
					<span class="manner-explain">20 ~ 29 점</span>
				</div>
				<div class="manner-box">
					<img class="manner-photo" src="<%=cp %>/img/mannerLevel/manner_3.png">
					<span class="manner-explain">30 ~ 39 점 (기본)</span>
				</div>
				<div class="manner-box">
					<img class="manner-photo" src="<%=cp %>/img/mannerLevel/manner_4.png">
					<span class="manner-explain">40 ~ 49 점</span>
				</div>
				<div class="manner-box">
					<img class="manner-photo" src="<%=cp %>/img/mannerLevel/manner_5.png">
					<span class="manner-explain">50 ~ 59 점</span>
				</div>
				<div class="manner-box">
					<img class="manner-photo" src="<%=cp %>/img/mannerLevel/manner_6.png">
					<span class="manner-explain">60 ~ 100 점</span>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>