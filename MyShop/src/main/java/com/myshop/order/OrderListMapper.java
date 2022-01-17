package com.myshop.order;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderListMapper {
	void insert(OrderList o);

	ArrayList<OrderList> select();

	ArrayList<OrderList> selectById(String mem_id);

	void update(OrderList o);

	void delete(int num);
}