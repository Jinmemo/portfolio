package odi_project.board.controller.commonBoardController;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class CommonBoardListController
 */
@WebServlet("/commonlist.bo")
public class CommonBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommonBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardServiceImpl();
		
		int listCount = service.selectListCount();
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String currentPageParam = request.getParameter("currentPage");
		int currentPage = (currentPageParam != null) ? Integer.parseInt(currentPageParam) : 1;
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> commonList = service.selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("commonList", commonList);
		
		request.getRequestDispatcher("WEB-INF/views/board/commonBoard/commonBoardListView.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
