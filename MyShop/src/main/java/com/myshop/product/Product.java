package com.myshop.product;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import com.myshop.category.Category;

public class Product {
	private int num;
	private String product_title;
	private int product_price;
	private int product_quantity;
	private String product_content;
	private String product_image;
	private int cate1_num;
	private int cate2_num;
	private Category category1, category2;
	private int discount;
	private String[] files;

	public Product() {
		super();
	}

	public Product(int num, String product_title, int product_price, int product_quantity, String product_content,
			String product_image, int cate1_num, int cate2_num, Category category1, Category category2, int discount) {
		super();
		this.num = num;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_quantity = product_quantity;
		this.product_content = product_content;
		this.product_image = product_image;
		this.cate1_num = cate1_num;
		this.cate2_num = cate2_num;
		this.category1 = category1;
		this.category2 = category2;
		this.discount = discount;
	}

	public Product(int num, String product_title, int product_price, int product_quantity, String product_content,
			String product_image, int cate1_num, int cate2_num, Category category1, Category category2, int discount,
			String[] files) {
		super();
		this.num = num;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_quantity = product_quantity;
		this.product_content = product_content;
		this.product_image = product_image;
		this.cate1_num = cate1_num;
		this.cate2_num = cate2_num;
		this.category1 = category1;
		this.category2 = category2;
		this.discount = discount;
		this.files = files;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public int getCate1_num() {
		return cate1_num;
	}

	public void setCate1_num(int cate1_num) {
		this.cate1_num = cate1_num;
	}

	public int getCate2_num() {
		return cate2_num;
	}

	public void setCate2_num(int cate2_num) {
		this.cate2_num = cate2_num;
	}

	public Category getCategory1() {
		return category1;
	}

	public void setCategory1(Category category1) {
		this.category1 = category1;
	}

	public Category getCategory2() {
		return category2;
	}

	public void setCategory2(Category category2) {
		this.category2 = category2;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "Product [num=" + num + ", product_title=" + product_title + ", product_price=" + product_price
				+ ", product_quantity=" + product_quantity + ", product_content=" + product_content + ", product_image="
				+ product_image + ", cate1_num=" + cate1_num + ", cate2_num=" + cate2_num + ", category1=" + category1
				+ ", category2=" + category2 + ", discount=" + discount + ", files=" + Arrays.toString(files) + "]";
	}

}