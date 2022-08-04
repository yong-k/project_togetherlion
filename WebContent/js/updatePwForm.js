/* updatePwForm.js */

	
	$(function()
	{
		$(".findBtn").click(function()
		{
			$("#pwErrMsg").css("display", "none");
			$("#pwCheckErrMsg").css("display", "none");
			$("#findErrMsg").css("display", "none");
			
			let pw = $("#pw").val();
			let pwCheck = $("#pwCheck").val();
			
			if (pw.replaceAll(' ', '') == "" || pwCheck.replaceAll(' ', '') == "" )
			{
				$("#findErrMsg").css("display", "block");
				return false;
			}
			
			// 비밀번호 형식 맞는지 확인
			if (!(pw.length >= 6 && isPwFormat(pw)))
			{
				$("#pwErrMsg").html("8~16자(소문자,숫자,특수문자 포함)");
				$("#pwErrMsg").css("display", "block");
				$("#pw").focus();
				return false;
			}
			
			
			// 비밀번호 == 비밀번호확인 맞는지 확인
			if ($("#pwCheck").val() != $("#pw").val())
			{
				$("#pwCheckErrMsg").html("비밀번호가 일치하지 않습니다.");
				$("#pwCheckErrMsg").css("display", "block");
				$("#pwCheck").focus();
				return false;
			}
			
			$("#updatePwForm").submit();
		});
	});
	
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
