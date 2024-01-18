package odi_project.member.controller.MyPageChatFriend;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;

/**
 * Servlet implementation class AjaxMyPageAcceptController
 */
@WebServlet("/myPageAcceptBtn.me")
public class AjaxMyPageAcceptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxMyPageAcceptController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int withNo = Integer.parseInt(request.getParameter("withNo"));
		
		BoardService boardService = new BoardServiceImpl();
		
		int result = boardService.updateMyPageAccept(withNo);
		
		if(result > 0) {
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(result);
		} else {
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
				
	}

}
