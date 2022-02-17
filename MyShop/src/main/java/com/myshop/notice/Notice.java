package com.myshop.notice;

import java.util.Date;

public class Notice {
	private int num;
	private String notice_title;
	private String notice_content;
	private Date write_date;

	public Notice() {
		super();
	}

	public Notice(int num, String notice_title, String notice_content, Date write_date) {
		super();
		this.num = num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.write_date = write_date;
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

	public Date getwrite_date() {
		return write_date;
	}

	public void setwrite_date(Date write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "Notice [num=" + num + ", notice_title=" + notice_title + ", notice_content=" + notice_content
				+ ", write_date=" + write_date + "]";
	}
}