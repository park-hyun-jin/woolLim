package com.kh.tido.common;

import com.kh.tido.inquiry.model.vo.PageInfo;

public class Pagination3 {

	private static PageInfo pi = null;
	
	public static PageInfo getPageInfo() {
		
		return pi;
	}
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		int limit =	10;
		int pagingBarSize = 5;
		
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)Math.ceil(((double)listCount / limit));
		startPage = (currentPage - 1) / pagingBarSize * pagingBarSize + 1;
		endPage = startPage + pagingBarSize - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		if(pi == null) {
			pi = new PageInfo(currentPage, listCount, pagingBarSize, maxPage, startPage, endPage, limit);
		}
		else {
			pi.setCurrentPage(currentPage);
			pi.setListCount(listCount);
			pi.setPagingBarSize(pagingBarSize);
			pi.setMaxPage(maxPage);
			pi.setStartPage(startPage);
			pi.setEndPage(endPage);
			pi.setLimit(limit);
		}
		return pi;
	}
}
