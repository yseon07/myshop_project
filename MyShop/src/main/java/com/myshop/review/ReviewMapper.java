package com.myshop.review;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	void insert(Review r);
	ArrayList<Review> selectByNum(int p_num);
	void update(Review r);
	void delete(int num);
}