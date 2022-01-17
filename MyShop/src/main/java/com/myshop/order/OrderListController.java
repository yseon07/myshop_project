package com.myshop.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class OrderListController {
	@Autowired
	private OrderListService service;
}