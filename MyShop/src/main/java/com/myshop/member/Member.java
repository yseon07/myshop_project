package com.myshop.member;

import java.util.Date;

public class Member {
	private String member_id;
	private String member_pwd;
	private String member_nickname;
	private String member_phone;
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private String member_birty;

	// default value 존재
	private Date joinDate;
	private int member_level;
	private int member_point;
	private int member_block;
	private int member_type;

	public Member() {
		super();
	}

	public Member(String member_id, String member_pwd, String member_nickname, String member_phone,
			String member_zipcode, String member_address1, String member_address2, String member_birty, Date joinDate,
			int member_level, int member_point, int member_block, int member_type) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_nickname = member_nickname;
		this.member_phone = member_phone;
		this.member_zipcode = member_zipcode;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.member_birty = member_birty;
		this.joinDate = joinDate;
		this.member_level = member_level;
		this.member_point = member_point;
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

	public String getMember_birty() {
		return member_birty;
	}

	public void setMember_birty(String member_birty) {
		this.member_birty = member_birty;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getMember_level() {
		return member_level;
	}

	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
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
				+ member_address1 + ", member_address2=" + member_address2 + ", member_birty=" + member_birty
				+ ", joinDate=" + joinDate + ", member_level=" + member_level + ", member_point=" + member_point
				+ ", member_block=" + member_block + ", member_type=" + member_type + "]";
	}
}