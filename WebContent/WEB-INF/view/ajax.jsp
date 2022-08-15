<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ajaxCode = (String)request.getAttribute("ajaxCode");
	// JSON 데이터 → {"이름1":"값1", "이름2":"값2"}
	String result = "";
	
	if (ajaxCode.equals("idCheck"))
	{
		StringBuffer sb = new StringBuffer();
		int checkId = (Integer)request.getAttribute("checkId");
		int checkWithdrawId = (Integer)request.getAttribute("checkWithdrawId");
		
		sb.append("{\"checkId\":\"" + checkId + "\", \"checkWithdrawId\":\"" + checkWithdrawId + "\"}");
		result = sb.toString();
	}
	else if (ajaxCode.equals("admin_idCheck"))
	{
		StringBuffer sb = new StringBuffer();
		int checkId = (Integer)request.getAttribute("checkId");
		
		sb.append("{\"checkId\":\"" + checkId + "\"}");
		result = sb.toString();
	}
	else if (ajaxCode.equals("telCheck"))
	{
		StringBuffer sb = new StringBuffer();
		int checkTel = (Integer)request.getAttribute("checkTel");
		
		sb.append("{\"checkTel\":\"" + checkTel + "\"}");
		result = sb.toString();
	}
	else if (ajaxCode.equals("nicknameCheck"))
	{
		StringBuffer sb = new StringBuffer();
		int checkNickname = (Integer)request.getAttribute("checkNickname");
		
		sb.append("{\"checkNickname\":\"" + checkNickname + "\"}");
		result = sb.toString();
	}
	else if (ajaxCode.equals("telAuth"))
	{
		String smsCode = (String)request.getAttribute("smsCode");
		result = smsCode;
	}
	else if (ajaxCode.equals("telAuthCheck"))
	{
		Boolean authCheck = (boolean)request.getAttribute("result");
		out.println(authCheck);
		return;
	}
	
	out.println(result);
%>
