package com.myshop.member;

import java.util.Date;

public class Member {
	private String member_id;
	private String member_pwd;
	private String member_nick;
	private String member_phone;
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private Date birty;

	// default value 존재
	private Date joinDate;
	private int money;
	private int mem_level;
	private int pointer;
	private int member_block;
	private int member_type;

	public Member() {
		super();
	}

	public Member(String member_id, String member_pwd, String member_nick, String member_phone, String member_zipcode,
			String member_address1, String member_address2, Date birty, Date joinDate, int money, int mem_level,
			int pointer, int member_block, int member_type) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_nick = member_nick;
		this.member_phone = member_phone;
		this.member_zipcode = member_zipcode;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.birty = birty;
		this.joinDate = joinDate;
		this.money = money;
		this.mem_level = mem_level;
		this.pointer = pointer;
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

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
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

	public int getMem_level() {
		return mem_level;
	}

	public void setMem_level(int mem_level) {
		this.mem_level = mem_level;
	}

	public int getPointer() {
		return pointer;
	}

	public void setPointer(int pointer) {
		this.pointer = pointer;
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
		return "Member [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_nick=" + member_nick
				+ ", member_phone=" + member_phone + ", member_zipcode=" + member_zipcode + ", member_address1="
				+ member_address1 + ", member_address2=" + member_address2 + ", birty=" + birty + ", joinDate="
				+ joinDate + ", money=" + money + ", mem_level=" + mem_level + ", pointer=" + pointer
				+ ", member_block=" + member_block + ", member_type=" + member_type + "]";
	}
}