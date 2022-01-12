package com.myshop.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	@Autowired
	private ProductMapper mapper;

	public ArrayList<Product> getAll() {
		return mapper.select();
	}

	public Product getProduct(int num) {
		return mapper.selectByNum(num);
	}

	public void addProduct(Product p) {
		mapper.insert(p);
	}

	public void editProduct(Product p) {
		mapper.update(p);
	}

	public void delProduct(int num) {
		mapper.delete(num);
	}
}
