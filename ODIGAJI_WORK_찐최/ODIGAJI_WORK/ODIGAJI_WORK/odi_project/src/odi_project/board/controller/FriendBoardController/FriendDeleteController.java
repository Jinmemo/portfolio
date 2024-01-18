package odi_project.board.controller.FriendBoardController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.TravelFriendCategory;

/**
 * Servlet implementation class FriendDeleteController
 */
@WebServlet("/friendDelete.bo")
public class FriendDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FriendDeleteController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService boardService = new BoardServiceImpl();
		
		HttpSession session = request.getSession();
		
		
		int fboardNo = ((TravelFriendCategory) session.getAttribute("tfc")).getFboardNo();
		
		
		int result = boardService.deleteFriendBoard(fboardNo);
		
	
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제에 성공했습니다.");
			response.sendRedirect(request.getContextPath()+"/friendSearch.bo");
		}else {
			session.setAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
