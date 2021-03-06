package com.myshop.review;

import java.util.Date;

public class Review {
	private int num;
	private int p_num;
	private String mem_id;
	private int star;
	private String content;
	private Date writeDate;

	public Review() {
		super();
	}

	public Review(int num, int p_num, String mem_id, int star, String content, Date writeDate) {
		super();
		this.num = num;
		this.p_num = p_num;
		this.mem_id = mem_id;
		this.star = star;
		this.content = content;
		this.writeDate = writeDate;
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

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Review [num=" + num + ", p_num=" + p_num + ", mem_id=" + mem_id + ", star=" + star + ", content="
				+ content + ", writeDate=" + writeDate + "]";
	}
}