/* joinForm.js */

	var idCheck = 0;
	var telCheck = 0;
	var nicknameCheck = 0;

	$(document).ready(function()
    { 
		// 이용약관
    	$(".see-termsOfService").click(function()
		{
    		Swal.fire({
    			  title: '이용약관',
    			  html: '총칙<br />제1조(목적)<br />이 약관은 주식회사 컬리 회사(전자상거래 사업자)가 운영하는 인터넷사이트 마켓컬리(이하 "컬리"라 한다)에서 제공하는 전자상거래 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 컬리와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.*PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다. <br />제2조(정의)<br />① "컬리"란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br />② "이용자"란 "컬리"에 접속하여 이 약관에 따라 "컬리"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br />③ "회원"이라 함은 "컬리"에 회원등록을 한 자로서, 계속적으로 "컬리"가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br />④ "비회원"이라 함은 회원에 가입하지 않고 "컬리"가 제공하는 서비스를 이용하는 자를 말합니다.<br />⑤ "휴면회원"이라 함은 "컬리"의 "회원"중 1년 이상 서비스 이용 기록이 없는 자를 말합니다. 휴면 회원은 "컬리"의 정책에 따라 서비스 이용이 제한 될 수 있으며, 다시 서비스를 이용하기 위하여는 거래 안전 등을 위하여 "컬리"가 정하는 본인확인 절차 등을 이행하여야 올바른 "회원"의 서비스를 이용할 수 있습니다. <br />제3조 (약관 등의 명시와 설명 및 개정) <br />① "컬리"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호/모사전송번호/전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보 보호책임자 등을 이용자가 쉽게 알 수 있도록 컬리의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br />② "컬리"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회/배송책임/환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br />③ "컬리"는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「개인정보보호법」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br />④ "컬리"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "컬리"는 개정전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br />⑤ "컬리"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 "컬리"에 송신하여 "컬리"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br />⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.',
    			  confirmButtonText: '확인'
    			})
		});
    	$(".see-privacyPolicy").click(function()
		{
    		Swal.fire({
    			  title: '개인정보 수집·이용 (필수)',
    			  html: '총칙<br />제1조(목적)<br />이 약관은 주식회사 컬리 회사(전자상거래 사업자)가 운영하는 인터넷사이트 마켓컬리(이하 "컬리"라 한다)에서 제공하는 전자상거래 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 컬리와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.*PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다. <br />제2조(정의)<br />① "컬리"란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br />② "이용자"란 "컬리"에 접속하여 이 약관에 따라 "컬리"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br />③ "회원"이라 함은 "컬리"에 회원등록을 한 자로서, 계속적으로 "컬리"가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br />④ "비회원"이라 함은 회원에 가입하지 않고 "컬리"가 제공하는 서비스를 이용하는 자를 말합니다.<br />⑤ "휴면회원"이라 함은 "컬리"의 "회원"중 1년 이상 서비스 이용 기록이 없는 자를 말합니다. 휴면 회원은 "컬리"의 정책에 따라 서비스 이용이 제한 될 수 있으며, 다시 서비스를 이용하기 위하여는 거래 안전 등을 위하여 "컬리"가 정하는 본인확인 절차 등을 이행하여야 올바른 "회원"의 서비스를 이용할 수 있습니다. <br />제3조 (약관 등의 명시와 설명 및 개정) <br />① "컬리"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호/모사전송번호/전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보 보호책임자 등을 이용자가 쉽게 알 수 있도록 컬리의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br />② "컬리"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회/배송책임/환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br />③ "컬리"는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「개인정보보호법」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br />④ "컬리"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "컬리"는 개정전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br />⑤ "컬리"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 "컬리"에 송신하여 "컬리"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br />⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.',
    			  confirmButtonText: '확인'
    			})
		});
    	$(".see-privacyPolicy-choice").click(function()
		{
    		Swal.fire({
    			  title: '개인정보 수집·이용 (선택)',
    			  html: '총칙<br />제1조(목적)<br />이 약관은 주식회사 컬리 회사(전자상거래 사업자)가 운영하는 인터넷사이트 마켓컬리(이하 "컬리"라 한다)에서 제공하는 전자상거래 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 컬리와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.*PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다. <br />제2조(정의)<br />① "컬리"란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br />② "이용자"란 "컬리"에 접속하여 이 약관에 따라 "컬리"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br />③ "회원"이라 함은 "컬리"에 회원등록을 한 자로서, 계속적으로 "컬리"가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br />④ "비회원"이라 함은 회원에 가입하지 않고 "컬리"가 제공하는 서비스를 이용하는 자를 말합니다.<br />⑤ "휴면회원"이라 함은 "컬리"의 "회원"중 1년 이상 서비스 이용 기록이 없는 자를 말합니다. 휴면 회원은 "컬리"의 정책에 따라 서비스 이용이 제한 될 수 있으며, 다시 서비스를 이용하기 위하여는 거래 안전 등을 위하여 "컬리"가 정하는 본인확인 절차 등을 이행하여야 올바른 "회원"의 서비스를 이용할 수 있습니다. <br />제3조 (약관 등의 명시와 설명 및 개정) <br />① "컬리"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호/모사전송번호/전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보 보호책임자 등을 이용자가 쉽게 알 수 있도록 컬리의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br />② "컬리"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회/배송책임/환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br />③ "컬리"는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「개인정보보호법」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br />④ "컬리"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "컬리"는 개정전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br />⑤ "컬리"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 "컬리"에 송신하여 "컬리"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br />⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.',
    			  confirmButtonText: '확인'
    			})
		});
    	
    	// 아이디, 이름, 닉네임 입력한 공백 제거
    	$("#id").focusout(function()
		{
			$("#id").val($("#id").val().replaceAll(" ", ""));
		});
    	$("#name").focusout(function()
		{
			$("#name").val($("#name").val().replaceAll(" ", ""));
		});
    	$("#nickname").focusout(function()
		{
			$("#nickname").val($("#nickname").val().replaceAll(" ", ""));
		});
    	
    	// 아이디 <중복확인>
    	$("#idOverlapBtn").click(function()
		{
    		idCheck = 0;
    		let id = $("#id").val().replaceAll(" ", "");
    		$("#id").val(id);
    		
    		$("#idErrMsg").css("color", "red");
    		$("#idErrMsg").css("display", "none");
    		
			// 이메일 형식인지 확인
			if (!isEmailFormat($("#id").val()))
			{
				$("#idErrMsg").html("이메일 형식이 아닙니다.")
				$("#idErrMsg").css("display", "block");
				$("#id").focus();
			}
			else
			{
				$.ajax({
					type: "POST"
					//, url: "<%=cp%>/idcheck.lion"
					, url: "idcheck.lion"
					, data: { id : $("#id").val() }
					, dataType: "json"
					, success: function(result)
					{
						// 중복확인	
						// 회원정보테이블 중복확인
						if (result.checkId != 0)
						{
							$("#idErrMsg").html("이미 사용중인 아이디입니다.");
						}
						// 탈퇴테이블 중복확인
						else if (result.checkWithdrawId != 0)
						{
							$("#idErrMsg").html("탈퇴한 아이디입니다.");
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
    		let nickname = $("#nickname").val().replaceAll(" ", "");
			$("#nickname").val(nickname);
    		
    		$("#nicknameErrMsg").css("color", "red");
    		$("#nicknameErrMsg").css("display", "none");
    		
			// 공백 아닌지 확인
			if (nickname == "")
			{	
				$("#nicknameErrMsg").html("문자를 입력해주세요.");
				$("#nicknameErrMsg").css("display", "block");
				$("#nickname").focus();
			}
			else
			{
				$.ajax({
					type: "POST"
					//, url: "<%=cp%>/nicknamecheck.lion"
					, url: "nicknamecheck.lion"
					, data: { nickname : $("#nickname").val()}
					, dataType: "json"
					, success: function(result)
					{
						if (result.checkNickname > 0)
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
						$("#nickname").focus();
					}
					, error: function(e)
					{
						alert(e.responseText);
					}
				});
			}
		});
    	
    	// 이용약관 동의 <전체 동의> 클릭 시, 모두 선택되게
    	$(".join-allCheck").click(function()
		{
			let check = $(".join-allCheck").is(":checked");
			if (check)
				$("input[name=join-check]").prop("checked", true);
			else
				$("input[name=join-check]").prop("checked", false);
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
    	// 닉네임 값 변경 확인
    	$("#nickname").change(function()
		{
			nicknameCheck = 0;
		});
    	
    	
    	// <회원가입>
    	$(".joinBtn").click(function()
		{
    		$("#idErrMsg").css("display", "none");
			$("#pwErrMsg").css("display", "none");
			$("#pwCheckErrMsg").css("display", "none");
			$("#nameErrMsg").css("display", "none");
			$("#telErrMsg").css("display", "none");
			$("#nicknameErrMsg").css("display", "none");
			$("#agreeErrMsg").css("display", "none");
			$("#joinErrMsg").css("display", "none");
			
    		// 필수항목 비어있는지 체크
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
			var checkResult = true;
    		$("input[name=join-check]").each(function()
			{
				if ($(this).hasClass("check-require") && !($(this).is(":checked")))
				{
					$("#agreeErrMsg").css("display", "block");
					checkResult = false;
					return false;	//-- break 의미
				}
			});
    		if (checkResult === false)	
    			return false;
    		
    		// 아이디 중복검사 했는지 체크
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
    		// 닉네임 중복검사 했는지 체크
			if ($("#nickname").val().replaceAll().length != 0)
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
    		
    		// 비밀번호 형식 맞는지 확인
    		let pw = $("#pw").val();
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
    		
    		$("#joinForm").submit();
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
	
	// 아이디가 이메일 형식인지 체크
	function isEmailFormat(id)
	{
		let format = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
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

