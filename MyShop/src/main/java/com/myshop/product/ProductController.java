package com.myshop.product;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@GetMapping("/product")
	public ModelAndView allList() {
		ModelAndView mv = new ModelAndView("/product/productList");
		ArrayList<Product> list = service.getAll();
		mv.addObject("list", list);
		return mv;
	}
	
	@GetMapping("/product/add")
	public String addProduct() {
		return "/product/addProduct";
	}
	
	@GetMapping("/product/edit")
	public String editProduct() {
		return "/product/viewProduct";
	}
	
	@PostMapping("/product/add")
	public String addProduct(Product p,MultipartFile[] files, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/");
		return "redirect:/product";
	}
}