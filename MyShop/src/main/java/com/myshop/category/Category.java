package com.myshop.category;

public class Category {
	private int cate_num;
	private String cate_name;
	private int top_cate_num;

	public Category() {
		super();
	}

	public Category(int cate_num, String cate_name, int top_cate_num) {
		super();
		this.cate_num = cate_num;
		this.cate_name = cate_name;
		this.top_cate_num = top_cate_num;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public int getTop_cate_num() {
		return top_cate_num;
	}

	public void setTop_cate_num(int top_cate_num) {
		this.top_cate_num = top_cate_num;
	}

	@Override
	public String toString() {
		return "Category [cate_num=" + cate_num + ", cate_name=" + cate_name + ", top_cate_num=" + top_cate_num + "]";
	}
}