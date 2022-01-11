package com.myshop.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;

	public void addMember(Member m) {
		mapper.insert(m);
	}

	public ArrayList<Member> getAllMember() {
		return mapper.select();
	};

	public Member getMemById(String member_id) {
		return mapper.selectById(member_id);
	};

	public int getMemByNick(String member_nick) {
		return mapper.selectByNick(member_nick);
	};
	
	public String getMemByPhone(String member_phone) {
		return mapper.selectByPhone(member_phone);
	};

	public void editMem(Member m) {
		mapper.update(m);
	};

	public void editMemPwd(Member m) {
		mapper.updatePwd(m);
	};

	public void editMemMoney(Member m) {
		mapper.updateMoney(m);
	};

	public void editMemLevel(Member m) {
		mapper.updateLevel(m);
	}

	public void editMemPoint(Member m) {
		mapper.updatePoint(m);
	};

	public void editMemBlock(Member m) {
		mapper.updateBlock(m);
	};

	public void delMember(String member_id) {
		mapper.delete(member_id);
	};
}