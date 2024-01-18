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

/**
 * Servlet implementation class AjaxFriendReplyDeleteController
 */
@WebServlet("/friendReplyDelete.bo")
public class AjaxFriendReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFriendReplyDeleteController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		BoardService boardService = new BoardServiceImpl();
		
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		int fboardNo = Integer.parseInt(request.getParameter("fboardNo"));
		
		int result = boardService.deleteFriendReply(replyNo);
		
		
		
		if(result > 0) {
			
			response.sendRedirect("friendDetail.bo?fboardNo="+fboardNo);
			
		}else {
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
		System.out.println(result);
		
		response.getWriter().print(result);
	}

}
