package com.myshop.category;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	void insertCate1(Category c);
	void insertCate2(Category c);
	ArrayList<Category> selectCate1();
	ArrayList<Category> selectCate2();
	ArrayList<Category> selectCate2ByNum(int top_cate_num);
	void deleteCate1(int num);
	void deleteCate2(int num);
}
