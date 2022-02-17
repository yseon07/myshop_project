package com.myshop.notice;

public class Pagenation {
	private int page;
	private int interval;
	private int rStart;
	private int rEnd;

	public Pagenation() {
		this.page = 1;
		this.interval = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getInterval() {
		return interval;
	}

	public void setInterval(int interval) {
		if (interval <= 0 || interval > 100) {
			this.interval = 10;
			return;
		}
	}

	public int getPageStart() {
		return (this.page - 1) * interval;
	}

	public int getrStart() {
		rStart = ((page - 1) * interval) + 1;
		return rStart;
	}

	public int getrEnd() {
		rEnd = rStart + interval - 1;
		return rEnd;
	}

	@Override
	public String toString() {
		return "Pagenation [page=" + page + ", interval=" + interval + ", rStart=" + rStart + ", rEnd=" + rEnd + "]";
	}

}