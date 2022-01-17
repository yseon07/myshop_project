package com.myshop.notice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;

	public void addNotice(Notice n) {
		mapper.insert(n);
	}

	public ArrayList<Notice> getNoticeList() {
		return mapper.select();
	}

	public Notice getNotice(int num) {
		return mapper.selectByNum(num);
	}
	
	public void editNotice(Notice n) {
		mapper.update(n);
	}
	
	public void delNotice(int num) {
		mapper.delete(num);
	}
}