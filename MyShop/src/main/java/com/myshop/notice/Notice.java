package com.myshop.notice;

import java.util.Date;

public class Notice {
	private int num;
	private String notice_title;
	private String notice_content;
	private Date writer_date;

	public Notice() {
		super();
	}

	public Notice(int num, String notice_title, String notice_content, Date writer_date) {
		super();
		this.num = num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.writer_date = writer_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getWriter_date() {
		return writer_date;
	}

	public void setWriter_date(Date writer_date) {
		this.writer_date = writer_date;
	}

	@Override
	public String toString() {
		return "Notice [num=" + num + ", notice_title=" + notice_title + ", notice_content=" + notice_content
				+ ", writer_date=" + writer_date + "]";
	}
}