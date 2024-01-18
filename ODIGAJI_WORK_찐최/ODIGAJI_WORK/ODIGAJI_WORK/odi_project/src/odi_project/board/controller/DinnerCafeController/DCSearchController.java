package odi_project.board.controller.DinnerCafeController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.DinnerCafe;
import odi_project.common.model.vo.TFPageInfo;
import odi_project.common.model.vo.TFPagination;

/**
 * Servlet implementation class TFSearchController
 */
//여행지&축제 페이지 검색기능
@WebServlet("/dcsearch.bo")
public class DCSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /** @see HttpServlet#HttpServlet() */
    public DCSearchController() {
        super();
    }

	/** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String condition = request.getParameter("condition"); 
		String keyword = request.getParameter("keyword");
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		BoardService boardservice = new BoardServiceImpl();
		
		int searchCount = boardservice.searchDinnerListCount(map); //현재 검색결과에 맞는 게시글의 총 갯수
		String currentPageParam = request.getParameter("currentPage");//현재 페이지
		int currentPage = (currentPageParam != null) ? Integer.parseInt(currentPageParam) : 1;
		int pageLimit = 5;
		int boardLimit = 12;
		
		TFPageInfo pi = TFPagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		ArrayList<DinnerCafe> list = boardservice.searchDinnerList(map,pi);
		
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		//썸네일
		list.stream().forEach( dc -> {
			
			ArrayList<String> dinnerImgList = dc.getDinnerImg();
			
			if (dinnerImgList != null && !dinnerImgList.isEmpty()) {
		        dc.setThumbNail(dinnerImgList.get(0));
			} else {
				dc.setThumbNail("./image/dcimage/사진이없습니다.jpg");
			}
		
		});
		
		request.getRequestDispatcher("/WEB-INF/views/board/dinnerCafeBoard/dcview.jsp").forward(request, response);
	}

	/** @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
