package com.myshop.order;

import java.util.Date;

import com.myshop.product.Product;

public class OrderList {
	private int num;
	private int p_num;
	private String mem_id;
	private int quantity;
	private int price;
	private Date order_date;
	private String mem_code;
	private String send_address;
	private String send_memo;
	private int mem_point;
	private Product product;

	public OrderList() {
		super();
	}

	public OrderList(int num, int p_num, String mem_id, int quantity, int price, Date order_date, String mem_code,
			String send_address, String send_memo, int mem_point, Product product) {
		super();
		this.num = num;
		this.p_num = p_num;
		this.mem_id = mem_id;
		this.quantity = quantity;
		this.price = price;
		this.order_date = order_date;
		this.mem_code = mem_code;
		this.send_address = send_address;
		this.send_memo = send_memo;
		this.mem_point = mem_point;
		this.product = product;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getMem_code() {
		return mem_code;
	}

	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}

	public String getSend_address() {
		return send_address;
	}

	public void setSend_address(String send_address) {
		this.send_address = send_address;
	}

	public String getSend_memo() {
		return send_memo;
	}

	public void setSend_memo(String send_memo) {
		this.send_memo = send_memo;
	}

	public int getMem_point() {
		return mem_point;
	}

	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "OrderList [num=" + num + ", p_num=" + p_num + ", mem_id=" + mem_id + ", quantity=" + quantity
				+ ", price=" + price + ", order_date=" + order_date + ", mem_code=" + mem_code + ", send_address="
				+ send_address + ", send_memo=" + send_memo + ", mem_point=" + mem_point + ", product=" + product + "]";
	}

}