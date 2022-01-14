package com.myshop.like;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeMapper {
	void insert(Like l);
	int selectById(Like l);
	int selectCount(int p_num);
	void delete(Like l);
}