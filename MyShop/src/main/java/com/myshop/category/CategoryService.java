package com.myshop.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryMapper mapper;

	public void addCate(Category c, String check) {
		if (check.equals("cate1")) {
			mapper.insertCate1(c);
		} else {
			mapper.insertCate2(c);
		}
	}

	public ArrayList<Category> getCateList(String check) {
		if (check.equals("cate1")) {
			return mapper.selectCate1();
		} else {
			return mapper.selectCate2();
		}
	}

	public ArrayList<Category> getCate(int num) {
		return mapper.selectCate2ByNum(num);
	}

	public void delCate1(String check, int num) {
		if (check.equals("cate1")) {
			mapper.deleteCate1(num);
		} else {
			mapper.deleteCate2(num);
		}
	}
}
