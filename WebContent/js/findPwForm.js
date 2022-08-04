/* findPwForm.js */
	
	var telCheck = 0;
	
	$(function()
	{
		// 아이디 입력 공백 제거
		$("#id").focusout(function()
		{
			$("#id").val($("#id").val().replaceAll(" ", ""));
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
    	
		// <인증번호 전송>
		$("#telAuthBtn").click(function()
		{
			let tel = $("#tel").val();
			$("#telErrMsg").css("display", "none");
			
			// 자릿수 확인
			if (tel.length < 10)
			{
				$("#telErrMsg").html("올바른 번호 형식이 아닙니다.");
				$("#telErrMsg").css("display", "block");
				$("#tel").focus();
				return false;
			}
			
			// 인증번호 전송
			let param = "tel=" + tel;
			ajax("telauth.lion", param, callback, 'GET');
		});
		
		// <인증번호 확인>
		$("#telAuthCheckBtn").click(function()
		{
			let telCheckNum = $("#telCheckNum").val();
			let param = "telCheckNum=" + telCheckNum;
			ajax("telauthcheck.lion", param, callbackCheck, 'GET');
		});
		
		
		// 비밀번호 찾기
		$(".findBtn").click(function()
		{
			$("#findErrMsg").css("display", "none");
			$("#idErrMsg").css("display", "none");
			$("#telErrMsg").css("display", "none");
			
			let id = $("#id").val();
			let tel = $("#tel").val();
			let telCheckNum = $("#telCheckNum").val();
			
			if (id == "" || tel == "")
			{
				$("#findErrMsg").css("display", "block");
				return false;
			}
			
			// 이메일 형식인지 확인
			if (!isEmailFormat(id))
			{
				$("#idErrMsg").css("display", "block");
				$("#id").focus();
				return false;
			}
			
			// 핸드폰 인증했는지 체크
    		if (telCheck == 0)
    		{
    			$("#telErrMsg").html("인증번호 받기를 진행해주세요.");
        		$("#telErrMsg").css("display", "block");
        		$("#tel").focus();
        		return false;
    		}
    		
    		$("#findPwForm").submit();
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
		{
			Swal.fire({
				  icon: 'success',
				  title: '인증번호를 전송했습니다.',
				  confirmButtonText: '확인'
				});
		}
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
				Swal.fire({
					  icon: 'success',
					  title: '인증되었습니다.',
					  confirmButtonText: '확인'
					});
				
				telCheck++;
				$("#telAuthBtn").css("display", "none");
	    		$("#telCheckNum").attr("readonly", true);
	    		$("#telAuthCheckBtn").css("display", "none");
			}
			else
			{
				Swal.fire({
					  icon: 'error',
					  title: '인증번호가 일치하지 않습니다.',
					  confirmButtonText: '확인'
					});
			}
		}
	}
	
	// 아이디가 이메일 형식인지 체크
	function isEmailFormat(id)
	{
		let format = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (format.test(id))
			return true;
		return false;
	}