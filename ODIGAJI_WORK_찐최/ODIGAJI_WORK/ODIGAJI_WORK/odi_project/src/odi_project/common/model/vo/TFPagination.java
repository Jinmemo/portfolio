package odi_project.common.model.vo;

public class TFPagination {
	
	public static TFPageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
			
		int maxPage = (int) Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage ;
		} 
		
		TFPageInfo pi = new TFPageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		return pi;
	}

}
