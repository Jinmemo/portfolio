package odi_project.board.controller.FriendBoardController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.FriendReply;
import odi_project.board.model.vo.FriendWith;
import odi_project.board.model.vo.TravelFriendCategory;

/**
 * Servlet implementation class FriendDetailViewController
 */
@WebServlet("/friendDetail.bo")
public class FriendDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FriendDetailViewController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int fboardNo = Integer.parseInt(request.getParameter("fboardNo"));
		
		BoardService service = new BoardServiceImpl();
		
		HttpSession session = request.getSession();
		
		TravelFriendCategory tfc = service.friendDetailView(fboardNo);
		
		// 댓글 목록
		ArrayList<FriendReply> replyList = service.selectFriendReplyList();
		
		request.setAttribute("replyList", replyList);
		System.out.println(replyList);
		
		 
		request.setAttribute("tfc", tfc);
		session.setAttribute("tfc", tfc);
		
		System.out.println(tfc);
		
		// 여행 동행 수락한 리스트
		ArrayList<FriendWith> fw = service.selectAcceptList(fboardNo);
		request.setAttribute("fw", fw);
		System.out.println(fw);
		
		request.getRequestDispatcher("WEB-INF/views/board/friendBoard/travelFriendDetail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
