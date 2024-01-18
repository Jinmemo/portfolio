package odi_project.board.controller.commonBoardController;

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
import odi_project.board.model.vo.Board;
import odi_project.common.model.vo.PageInfo;
import odi_project.common.template.Pagenation;

/**
 * Servlet implementation class CommonBoardSearchController
 */
@WebServlet("/boardSearch.bo")
public class CommonBoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommonBoardSearchController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");

		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);

		BoardService boardservice = new BoardServiceImpl();

///v페이징처리			

		int searchCount = boardservice.commonsearchlist(map); // 현재 검색결과에 맞는 게시글의 총 갯수
		String currentPageParam = request.getParameter("currentPage");// 현재 페이지
		int currentPage = (currentPageParam != null) ? Integer.parseInt(currentPageParam) : 1;
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagenation.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> commonList = boardservice.searchBoardList(map, pi);

		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);

//페이지
		request.setAttribute("pi", pi);
		request.setAttribute("commonList", commonList);
		
		request.getRequestDispatcher("/WEB-INF/views/board/commonBoard/commonBoardListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
