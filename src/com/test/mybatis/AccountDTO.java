package com.test.mybatis;

public class AccountDTO
{
	private String code, account_number, member_code, bank_code, bank_name, is_main_account;

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getAccount_number()
	{
		return account_number;
	}

	public void setAccount_number(String account_number)
	{
		this.account_number = account_number;
	}

	public String getMember_code()
	{
		return member_code;
	}

	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}

	public String getBank_code()
	{
		return bank_code;
	}

	public void setBank_code(String bank_code)
	{
		this.bank_code = bank_code;
	}

	public String getBank_name()
	{
		return bank_name;
	}

	public void setBank_name(String bank_name)
	{
		this.bank_name = bank_name;
	}

	public String getIs_main_account()
	{
		return is_main_account;
	}

	public void setIs_main_account(String is_main_account)
	{
		this.is_main_account = is_main_account;
	}
	
}
