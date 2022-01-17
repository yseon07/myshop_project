package com.myshop.notice;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	void insert(Notice n);

	ArrayList<Notice> select();

	Notice selectByNum(int num);

	void update(Notice n);

	void delete(int num);
}