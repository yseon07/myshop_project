package com.myshop.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	void insert(Member m);

	ArrayList<Member> select();

	Member selectById(String member_id);

	int selectByNick(String nickname);
	
	String selectByPhone(String member_phone);

	void update(Member m);

	void updatePwd(Member m);

	void updateMoney(Member m);

	void updateLevel(Member m);

	void updatePoint(Member m);

	void updateBlock(Member m);

	void delete(String member_id);
}