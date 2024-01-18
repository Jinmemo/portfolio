package odi_project.board.controller.FriendBoardController;

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
import odi_project.board.model.vo.TravelFriendBoard;
import odi_project.common.model.vo.TFPageInfo;
import odi_project.common.model.vo.TFPagination;

/**
 * Servlet implementation class FriendSearchModalController
 */
@WebServlet("/friendSearchModal.bo")
public class FriendSearchModalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FriendSearchModalController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category"); // 키워드
		String city = request.getParameter("city"); // 키워드
		String startDate = request.getParameter("startDate"); // 키워드
		String endDate = request.getParameter("endDate"); // 키워드
		
		HashMap<String, String> map = new HashMap();  // HashMap<key, value>
		map.put("category", category);
		map.put("city", city);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		BoardService boardService = new BoardServiceImpl();
		

		ArrayList<TravelFriendBoard> list = boardService.selectSearchModalList(map);
		
		request.setAttribute("category", category);
		request.setAttribute("city", city);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("WEB-INF/views/board/friendBoard/travelFriend.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
