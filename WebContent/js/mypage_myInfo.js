/* mypage_myinfo.js */

	var telCheck = 1;
	var nicknameCheck = 1;
	
	$(function()
	{
		// ???
		// 닉네임만 왜 $("#nickname").val() 로 안가져와지는 거지...
		// html(), text() 로는 가져와짐....
		/*
		alert($("#id").val());
		alert($("#tel").val());
		alert($("#nickname").val());
		alert($("#nickname").html());
		alert($("#nickname").text());
		*/
		let originalNickname = $('input[name=nickname]').val();
		let originalTel = $('#tel').val();
		
		// 닉네임 입력한 공백 제거
		$('input[name=nickname]').focusout(function()
		{
			$('input[name=nickname]').val($('input[name=nickname]').val().replaceAll(" ", ""));
		});
		// 핸드폰 값 변경 확인
		$("#tel").change(function()
		{
			telCheck = 0;
			$("#telAuthBtn").css("display", "inline");
			$("#telAuth").css("display", "none");
			$("#telCheckNum").removeAttr("readonly");
    		$("#telAuthCheckBtn").css("display", "inline");
		});
		// 닉네임 값 변경 확인
		$('input[name=nickname]').change(function()
		{
			nicknameCheck = 0;
		});
		
		// 휴대폰번호 <인증번호 전송>
    	$("#telAuthBtn").click(function()
		{
    		$("#telErrMsg").css("display", "none");
    		
    		// 자릿수 확인
    		if ($("#tel").val().length < 10)
			{
    			$("#telErrMsg").html("올바른 번호 형식이 아닙니다.");
				$("#telErrMsg").css("display", "block");
				$("#tel").focus();
				return false;
			}
    		
			// 중복여부 확인
			$.ajax({
				type: "POST"
				//, url: "<%=cp%>/telcheck.lion"
				, url: "telcheck.lion"
				, data: { tel : $("#tel").val() }
				, dataType: "json"
				, success: function(result)
				{
					if (result.checkTel > 0)
					{
						$("#telErrMsg").html("해당 휴대폰 번호로 가입된 아이디가 있습니다.");
						$("#telErrMsg").css("display", "block");
						$("#tel").focus();
						return false;
					}
					else
					{
						// 인증번호 전송
						
						let tel = $("#tel").val();
						let param = "tel=" + tel;
						ajax("telauth.lion", param, callback, 'GET');
					}
						
				}
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
    	// 휴대폰번호 <인증번호 확인>
    	$("#telAuthCheckBtn").click(function()
		{
			let telCheckNum = $("#telCheckNum").val();
			let param = "telCheckNum=" + telCheckNum;
			ajax("telauthcheck.lion", param, callbackCheck, 'GET');
		});
		
		// 닉네임 <중복확인>
    	$("#nicknameOverlapBtn").click(function()
		{	
    		$('input[name=nickname]').val($('input[name=nickname]').val().replaceAll(" ", ""));
    		
    		$("#nicknameErrMsg").css("color", "red");
    		$("#nicknameErrMsg").css("display", "none");
    		
			// 공백 아닌지 확인
			if ($('input[name=nickname]').val() == "")
			{	
				$("#nicknameErrMsg").html("문자를 입력해주세요.");
				$("#nicknameErrMsg").css("display", "block");
				$('input[name=nickname]').focus();
			}
			else
			{
				$.ajax({
					type: "POST"
					//, url: "<%=cp%>/nicknamecheck.lion"
					, url: "nicknamecheck.lion"
					, data: { nickname : $('input[name=nickname]').val()}
					, dataType: "json"
					, success: function(result)
					{
						if ($('input[name=nickname]').val() != originalNickname && result.checkNickname > 0)
						{
							$("#nicknameErrMsg").html("이미 사용중인 닉네임입니다.");
						}
						else
						{
							$("#nicknameErrMsg").html("사용가능한 닉네임입니다.");
							$("#nicknameErrMsg").css("color", "blue");
							nicknameCheck++;
						}
						$("#nicknameErrMsg").css("display", "block");
						$('input[name=nickname]').focus();
					}
					, error: function(e)
					{
						alert(e.responseText);
					}
				});
			}
		});		
		
    	
    	// <회원정보수정> 버튼 클릭
		$("#myInfoUpdateBtn").click(function()
		{
			$("#pwErrMsg").css("display", "none");
			$("#pwCheckErrMsg").css("display", "none");
			$("#telErrMsg").css("display", "none");
			$("#nicknameErrMsg").css("display", "none");
			$("#myInfoErrMsg").css("display", "none");
			
			// 필수항목 비어있는지 체크(현재비밀번호, 휴대폰번호)
			if ($("#nowPw").val().replaceAll(' ', '') == "" || $("#tel").val().replaceAll(' ', '') == "")
			{
    			$("#myInfoErrMsg").css("display", "block");
				return false;
    		}
			// 휴대폰 값 변경됐다면 인증했는지 체크 (현재 번호와 동일하다면 skip)
			if (telCheck == 0 && $("#tel").val() != originalTel)
    		{
    			$("#telErrMsg").html("인증번호 받기를 진행해주세요.");
        		$("#telErrMsg").css("display", "block");
        		$("#tel").focus();
        		return false;
    		}
			
			// 닉네임 값 변경됐다면 중복검사 했는지 체크 (공백인 경우는 X) (현재 닉네임과 동일하다면 skip)
			if ($('input[name=nickname]').val().replaceAll().length != 0 
				&& $('input[name=nickname]').val() != originalNickname)
    		{
				if (nicknameCheck == 0)
				{
	    			$("#nicknameErrMsg").html("중복검사를 진행해주세요.");
	    			$("#nicknameErrMsg").css("color", "red");
	        		$("#nicknameErrMsg").css("display", "block");
	        		$("#nickname").focus();
	        		return false;
				}
    		}
			
			// 비밀번호 변경 시, (새 비밀번호/새 비밀번호 확인 칸이 공백이 아닐 경우)
			if ($("#pw").val().replaceAll(' ', '') != ""  || $("#pwCheck").val().replaceAll(' ', '') != "")
			{
				// 비밀번호 형식 맞는지 확인
				let pw = $("#pw").val();
				if (!(pw.length >= 6 && isPwFormat(pw)))
				{
					$("#pwErrMsg").html("8~16자(소문자,숫자,특수문자 포함)");
	    			$("#pwErrMsg").css("display", "block");
	    			$("#pw").focus();
	    			return false;
				}
				// 새 비밀번호 ==  새 비밀번호 확인 맞는지 확인
				if ($("#pwCheck").val() != pw)
				{
					$("#pwCheckErrMsg").html("비밀번호가 일치하지 않습니다.");
	    			$("#pwCheckErrMsg").css("display", "block");
	    			$("#pwCheck").focus();
	    			return false;
				}
			}
			
			$("#myInfoUpdateForm").submit();
		});
	});

	// 휴대폰 인증 관련 함수들
	function ajax(url, params, callback, method)
	{
		var xhttp = new XMLHttpRequest();
		method = method.toUpperCase();
		if (method != 'POST')
			method = 'GET';
		if (method == 'GET')
			url = url + "?" + params;
		xhttp.open(method, url, true);
		xhttp.setRequestHeader('Content-Type', 'application/x-www-form-unlencoded');
		xhttp.send(method == 'POST' ? params : null);
		xhttp.onreadystatechange = callback;
	}
	
	function callback()
	{
		if (this.readyState == 4 && this.status == 200)
			alert("인증번호를 전송했습니다.");
		$("#telAuthBtn").css("display", "none");
		$("#telAuth").css("display", "table-row");
	}
	
	function callbackCheck()
	{
		if (this.readyState == 4 && this.status == 200)
		{
			let result = this.responseText.trim();
			if (result == 'false')
			{
				alert("인증되었습니다.");
				telCheck++;
				$("#telAuthBtn").css("display", "none");
				$("#telCheckNum").attr("readonly", true);
				$("#telAuthCheckBtn").css("display", "none");
			}
			else
			{
				alert("인증번호가 일치하지 않습니다.");
			}
		}
	}
	
	
	// 비밀번호 체크 (8~16자, 영어/숫자/특수문자 하나 이상 포함)
	// 입력가능 특수문자(!, @, #, $, %, ^, +, -, =)
	function isPwFormat(pw)
	{	
		let format = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^+\-=])(?=\S+$).*$/
		if (format.test(pw))
			return true;
		return false;
	}