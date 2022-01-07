package com.myshop.member;

import java.sql.Date;

public class Member {
	private String member_id;
	private String member_pwd;
	private String member_nickname;
	private String member_phone;
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private Date birty;

	// default value 존재
	private Date joinDate;
	private int money;
	private int member_level;
	private int point;
	private int member_block;
	private int member_type;

	public Member() {
		super();
	}

	public Member(String member_id, String member_pwd, String member_nickname, String member_phone,
			String member_zipcode, String member_address1, String member_address2, Date birty, Date joinDate, int money,
			int member_level, int point, int member_block, int member_type) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_nickname = member_nickname;
		this.member_phone = member_phone;
		this.member_zipcode = member_zipcode;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.birty = birty;
		this.joinDate = joinDate;
		this.money = money;
		this.member_level = member_level;
		this.point = point;
		this.member_block = member_block;
		this.member_type = member_type;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public String getMember_address2() {
		return member_address2;
	}

	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}

	public Date getBirty() {
		return birty;
	}

	public void setBirty(Date birty) {
		this.birty = birty;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getMember_level() {
		return member_level;
	}

	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getMember_block() {
		return member_block;
	}

	public void setMember_block(int member_block) {
		this.member_block = member_block;
	}

	public int getMember_type() {
		return member_type;
	}

	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_nickname=" + member_nickname
				+ ", member_phone=" + member_phone + ", member_zipcode=" + member_zipcode + ", member_address1="
				+ member_address1 + ", member_address2=" + member_address2 + ", birty=" + birty + ", joinDate="
				+ joinDate + ", money=" + money + ", member_level=" + member_level + ", point=" + point
				+ ", member_block=" + member_block + ", member_type=" + member_type + "]";
	}

}