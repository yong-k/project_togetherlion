package com.test.mybatis;

public class MemberDTO
{
	private String code, id, pw, name, nickname, tel, member_code, regist_datetime
				 , score, photo_name;
	private String num;
	private String report_count;		// 관리자>전체회원>누적신고횟수
	private String report_datetime;		// 관리자>영구정지회원>영구정지일
	private String withdraw_dateitime;	// 관리자>탈퇴회원>탈퇴일

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getMember_code()
	{
		return member_code;
	}

	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}

	public String getRegist_datetime()
	{
		return regist_datetime;
	}

	public void setRegist_datetime(String regist_datetime)
	{
		this.regist_datetime = regist_datetime;
	}

	public String getScore()
	{
		return score;
	}

	public void setScore(String score)
	{
		this.score = score;
	}

	public String getPhoto_name()
	{
		return photo_name;
	}

	public void setPhoto_name(String photo_name)
	{
		this.photo_name = photo_name;
	}
	
	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public String getReport_count()
	{
		return report_count;
	}

	public void setReport_count(String report_count)
	{
		this.report_count = report_count;
	}

	public String getReport_datetime()
	{
		return report_datetime;
	}

	public void setReport_datetime(String report_datetime)
	{
		this.report_datetime = report_datetime;
	}

	public String getWithdraw_dateitime()
	{
		return withdraw_dateitime;
	}

	public void setWithdraw_dateitime(String withdraw_dateitime)
	{
		this.withdraw_dateitime = withdraw_dateitime;
	}
	
}
