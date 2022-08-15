/* admin_accountInsertForm.js */
	
	var idCheck = 0;
	var telCheck = 0;
	
	$(function()
	{
		// 아이디, 이름 입력한 공백 제거
    	$("#id").focusout(function()
		{
			$("#id").val($("#id").val().replaceAll(" ", ""));
		});
    	$("#name").focusout(function()
		{
			$("#name").val($("#name").val().replaceAll(" ", ""));
		});
    	
    	// 아이디 <중복확인>
    	$("#idOverlapBtn").click(function()
		{
    		idCheck = 0;
    		let id = $("#id").val().replaceAll(" ", "");
    		$("#id").val(id);
    		
    		$("#idErrMsg").css("color", "red");
    		$("#idErrMsg").css("display", "none");
    		
    		// 아이디 형식인지 확인
    		if (!isIdFormat($("#id").val()))
			{
				$("#idErrMsg").html("6~15자(영문자로 시작, 영어소문자+숫자 조합)")
				$("#idErrMsg").css("display", "block");
				$("#id").focus();
			}
    		else
			{
				$.ajax({
					type: "POST"
					, url: "admin_idcheck.lion"
					, data: { id : $("#id").val() }
					, dataType: "json"
					, success: function(result)
					{
						// 중복확인	
						if (result.checkId != 0)
						{
							$("#idErrMsg").html("이미 사용중인 아이디입니다.");
						}
						// 중복X
						else
						{
							$("#idErrMsg").html("사용가능한 아이디입니다.");
							$("#idErrMsg").css("color", "blue");
							idCheck++;
						}
						$("#idErrMsg").css("display", "block");
						$("#id").focus();
					}
					, error: function(e)
					{
						alert(e.responseText);
					}
				});
			}
		});

    		
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
    	
    	// ID 값 변경 확인
    	$("#id").change(function()
		{
			idCheck = 0;
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
		
		// <계정 생성> 버튼 클릭
		$(".saveBtn").click(function()		
		{
			$("#idErrMsg").css("display", "none");
			$("#pwErrMsg").css("display", "none");
			$("#pwCheckErrMsg").css("display", "none");
			$("#nameErrMsg").css("display", "none");
			$("#telErrMsg").css("display", "none");
			$("#joinErrMsg").css("display", "none");
			
			// 모든항목 작성했는지 체크
			if ($("#id").val().replaceAll(' ', '') == "" 
    			|| $("#pw").val().replaceAll(' ', '') == "" 
    			|| $("#pwCheck").val().replaceAll(' ', '') == "" 
    			|| $("#name").val().replaceAll(' ', '') == "" 
    			|| $("#tel").val().replaceAll(' ', '') == "" 
    			|| $("#telCheckNum").val().replaceAll(' ', '') == "")
    		{
    			$("#joinErrMsg").css("display", "block");
				return false;
    		}
			
			// 아이디 중복확인 했는지 체크
			if (idCheck == 0)
    		{
    			$("#idErrMsg").html("중복검사를 진행해주세요.");
    			$("#idErrMsg").css("color", "red");
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
			
			// 비밀번호 형식 맞는지 체크
			let pw = $("#pw").val();
    		if (!(pw.length >= 6 && isPwFormat(pw)))
    		{
    			$("#pwErrMsg").html("8~16자(소문자,숫자,특수문자 포함)");
    			$("#pwErrMsg").css("display", "block");
    			$("#pw").focus();
    			return false;
    		}
			// 비밀번호 == 비밀번호확인 값 동일한지 체크
    		if ($("#pwCheck").val() != $("#pw").val())
    		{
    			$("#pwCheckErrMsg").html("비밀번호가 일치하지 않습니다.");
    			$("#pwCheckErrMsg").css("display", "block");
    			$("#pwCheck").focus();
    			return false;
    		}
			// 이름 형식 체크
    		//--특수문자 정규식 변수(공백 미포함)
    		var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
    		//--완성형 아닌 한글 정규식
    		var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    		let name = $("#name").val();
    		if (name.length > 0)
			{
				if (name.match(replaceChar) || name.match(replaceNotFullKorean) || name.length < 2) 
				{
					$("#nameErrMsg").css("display", "block");
					return false;
				}
			}
    		
    		Swal.fire({
  			  title: '관리자 계정을 생성하시겠습니까?',
  			  showCancelButton: true,
  			  confirmButtonText: '생성',
  			  cancelButtonText: '취소',
  			  reverseButtons: true
  			}).then((result) => {
  			  if (result.isConfirmed) 
  				  $("#accountInsertForm").submit();
  			})
  			
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
				alert('인증되었습니다.');
				telCheck++;
				$("#telAuthBtn").css("display", "none");
	    		$("#telCheckNum").attr("readonly", true);
	    		$("#telAuthCheckBtn").css("display", "none");
			}
			else
			{
				alert('인증번호가 일치하지 않습니다.');
			}
		}
	}	
	
	// 아이디 형식 체크 (6~15자, 영문자로 시작, 영어소문자+숫자 조합)
	function isIdFormat(id)
	{
		let format = /^[a-z]+[a-z0-9]{5,14}$/g;
		if (format.test(id))
			return true;
		return false;
	}
	
	// 비밀번호 체크 (8~16자, 영어/숫자/특수문자 하나 이상 포함)
	// 입력가능 특수문자(!, @, #, $, %, ^, +, -, =)
	function isPwFormat(pw)
	{
		//let format = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%^*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		let format = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^+\-=])(?=\S+$).*$/
		if (format.test(pw))
			return true;
		return false;
	}