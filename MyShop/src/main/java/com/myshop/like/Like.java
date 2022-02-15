package com.myshop.like;

import com.myshop.product.Product;

public class Like {
	private int num;
	private int p_num;
	private String mem_id;
	private Product p;

	public Like() {
		super();
	}

	public Like(int num, int p_num, String mem_id, Product p) {
		super();
		this.num = num;
		this.p_num = p_num;
		this.mem_id = mem_id;
		this.p = p;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	@Override
	public String toString() {
		return "Like [num=" + num + ", p_num=" + p_num + ", mem_id=" + mem_id + ", p=" + p + "]";
	}
}