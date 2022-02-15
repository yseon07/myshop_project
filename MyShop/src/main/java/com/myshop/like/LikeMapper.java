package com.myshop.like;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeMapper {
	void insert(Like l);
	ArrayList selectById(Like l);
	int selectCountById(Like l);
	int selectCount(int p_num);
	void delete(Like l);
}