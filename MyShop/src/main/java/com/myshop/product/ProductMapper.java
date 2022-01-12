package com.myshop.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	void insert(Product p);
	ArrayList<Product> select();
	Product selectByNum(int num);
	void update(Product p);
	void delete(int num);
}