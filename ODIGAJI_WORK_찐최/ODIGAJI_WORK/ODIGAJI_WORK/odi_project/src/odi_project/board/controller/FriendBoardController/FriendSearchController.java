package odi_project.board.controller.FriendBoardController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.TravelFriendBoard;
import odi_project.common.model.vo.TFPageInfo;
import odi_project.common.model.vo.TFPagination;

/**
 * Servlet implementation class FriendSearchController
 */
@WebServlet("/friendSearch.bo")
public class FriendSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FriendSearchController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword"); // 키워드
		
		HashMap<String, String> map = new HashMap();  // HashMap<key, value>
		map.put("keyword", keyword);
		
		BoardService boardService = new BoardServiceImpl();
		

		ArrayList<TravelFriendBoard> list = boardService.selectSearchFriendList(map);
		
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("list", list);
		

		request.getRequestDispatcher("WEB-INF/views/board/friendBoard/travelFriend.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
