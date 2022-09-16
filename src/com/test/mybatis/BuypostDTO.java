package com.test.mybatis;

public class BuypostDTO
{
	// 공동구매 목록
	private String code, title, amount, buy_number, goods_num, count, goods_photo_name
		, left_day, left_hour, left_minute, left_second
		, region, sub_cate_code, main_cate_code, write_datetime, deadline, content;
	private String is_blind, wish_code;
	
	// 추가) 공동구매 게시물 상세보기
	private String member_code, nickname, photo_name, url, expiration_datetime, price
		, trade_datetime, location_x, location_y, content_photo_name
		, sub_cate_name, main_cate_name, participant_num;

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getAmount()
	{
		return amount;
	}

	public void setAmount(String amount)
	{
		this.amount = amount;
	}

	public String getBuy_number()
	{
		return buy_number;
	}

	public void setBuy_number(String buy_number)
	{
		this.buy_number = buy_number;
	}

	public String getGoods_num()
	{
		return goods_num;
	}

	public void setGoods_num(String goods_num)
	{
		this.goods_num = goods_num;
	}

	public String getCount()
	{
		return count;
	}

	public void setCount(String count)
	{
		this.count = count;
	}

	public String getGoods_photo_name()
	{
		return goods_photo_name;
	}

	public void setGoods_photo_name(String goods_photo_name)
	{
		this.goods_photo_name = goods_photo_name;
	}

	public String getLeft_day()
	{
		return left_day;
	}

	public void setLeft_day(String left_day)
	{
		this.left_day = left_day;
	}

	public String getLeft_hour()
	{
		return left_hour;
	}

	public void setLeft_hour(String left_hour)
	{
		this.left_hour = left_hour;
	}

	public String getLeft_minute()
	{
		return left_minute;
	}

	public void setLeft_minute(String left_minute)
	{
		this.left_minute = left_minute;
	}

	public String getLeft_second()
	{
		return left_second;
	}

	public void setLeft_second(String left_second)
	{
		this.left_second = left_second;
	}

	public String getRegion()
	{
		return region;
	}

	public void setRegion(String region)
	{
		this.region = region;
	}

	public String getSub_cate_code()
	{
		return sub_cate_code;
	}

	public void setSub_cate_code(String sub_cate_code)
	{
		this.sub_cate_code = sub_cate_code;
	}
	
	public String getMain_cate_code()
	{
		return main_cate_code;
	}

	public void setMain_cate_code(String main_cate_code)
	{
		this.main_cate_code = main_cate_code;
	}

	public String getWrite_datetime()
	{
		return write_datetime;
	}

	public void setWrite_datetime(String write_datetime)
	{
		this.write_datetime = write_datetime;
	}

	public String getDeadline()
	{
		return deadline;
	}

	public void setDeadline(String deadline)
	{
		this.deadline = deadline;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getMember_code()
	{
		return member_code;
	}

	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getPhoto_name()
	{
		return photo_name;
	}

	public void setPhoto_name(String photo_name)
	{
		this.photo_name = photo_name;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getExpiration_datetime()
	{
		return expiration_datetime;
	}

	public void setExpiration_datetime(String expiration_datetime)
	{
		this.expiration_datetime = expiration_datetime;
	}

	public String getPrice()
	{
		return price;
	}

	public void setPrice(String price)
	{
		this.price = price;
	}

	public String getTrade_datetime()
	{
		return trade_datetime;
	}

	public void setTrade_datetime(String trade_datetime)
	{
		this.trade_datetime = trade_datetime;
	}

	public String getLocation_x()
	{
		return location_x;
	}

	public void setLocation_x(String location_x)
	{
		this.location_x = location_x;
	}

	public String getLocation_y()
	{
		return location_y;
	}

	public void setLocation_y(String location_y)
	{
		this.location_y = location_y;
	}

	public String getContent_photo_name()
	{
		return content_photo_name;
	}

	public void setContent_photo_name(String content_photo_name)
	{
		this.content_photo_name = content_photo_name;
	}

	public String getSub_cate_name()
	{
		return sub_cate_name;
	}

	public void setSub_cate_name(String sub_cate_name)
	{
		this.sub_cate_name = sub_cate_name;
	}

	public String getMain_cate_name()
	{
		return main_cate_name;
	}

	public void setMain_cate_name(String main_cate_name)
	{
		this.main_cate_name = main_cate_name;
	}

	public String getIs_blind()
	{
		return is_blind;
	}

	public void setIs_blind(String is_blind)
	{
		this.is_blind = is_blind;
	}

	public String getWish_code()
	{
		return wish_code;
	}

	public void setWish_code(String wish_code)
	{
		this.wish_code = wish_code;
	}

	public String getParticipant_num()
	{
		return participant_num;
	}

	public void setParticipant_num(String participant_num)
	{
		this.participant_num = participant_num;
	}
	
}
