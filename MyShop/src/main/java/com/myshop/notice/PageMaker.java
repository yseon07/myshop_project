package com.myshop.notice;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int interval = 10;
	private Pagenation p;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public Pagenation getP() {
		return p;
	}

	public void setP(Pagenation p) {
		this.p = p;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getInterval() {
		return interval;
	}

	private void calcData() {
		endPage = (int) (Math.ceil(p.getPage() / (double) interval) * interval);
		startPage = (endPage - interval) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) p.getInterval()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * p.getInterval() >= totalCount ? false : true;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("interval", p.getInterval()).build();

		return uriComponents.toUriString();
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", interval=" + interval + ", p=" + p + "]";
	}

}