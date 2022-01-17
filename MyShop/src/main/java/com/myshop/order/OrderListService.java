package com.myshop.order;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderListService {
	@Autowired
	private OrderListMapper mapper;

	public void addOrderList(OrderList o) {
		mapper.insert(o);
	}

	public ArrayList<OrderList> getList() {
		return mapper.select();
	}

	public ArrayList<OrderList> getListByMem(String mem_id) {
		return mapper.selectById(mem_id);
	}
	
	public void delOrderList(int num) {
		mapper.delete(num);
	}
}
