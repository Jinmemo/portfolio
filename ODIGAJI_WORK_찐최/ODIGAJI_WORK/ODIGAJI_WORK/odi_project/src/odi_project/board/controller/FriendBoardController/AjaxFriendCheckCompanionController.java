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
import odi_project.member.model.vo.Member;


@WebServlet("/CheckCompanion.bo")
public class AjaxFriendCheckCompanionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxFriendCheckCompanionController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if((Member) session.getAttribute("loginUser") != null) {
			int fboardNo = Integer.parseInt(request.getParameter("fboardNo"));
	        String memberId = ((Member) session.getAttribute("loginUser")).getMemberId();
	        
	        BoardService boardService = new BoardServiceImpl();
	        
	        String status = boardService.checkCompanionStatus(fboardNo, memberId);
	        
	        response.getWriter().print(status);
		}

	
	}

}
