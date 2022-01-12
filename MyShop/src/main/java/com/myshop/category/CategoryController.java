package com.myshop.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService service;

	@GetMapping("/admin")
	public String getPage() {
		return "/category/categoryAdmin";
	}

	@GetMapping("/list")
	@ResponseBody
	public ArrayList<Category> getAllCate(@RequestParam String check) {
		return service.getCateList(check);
	}

	@GetMapping("/cate")
	@ResponseBody
	public ArrayList<Category> getCate(@RequestParam int cate_num) {
		return service.getCate(cate_num);
	}

	@PostMapping("/add")
	@ResponseBody
	public ArrayList<Category> addCate(Category c, String check) {
		service.addCate(c, check);
		ArrayList<Category> list = null;
		if (check.equals("cate1")) {
			list = service.getCateList("cate1");
		} else {
			list = service.getCate(c.getTop_cate_num());
		}
		return list;
	}
}