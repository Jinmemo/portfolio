package odi_project.member.controller.MyPageChatFriend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.FriendWith;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class MyPageAcceptController
 */
@WebServlet("/myPageFriendAcDe.me")
public class AjaxMyPageFriendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxMyPageFriendController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		BoardService boardService = new BoardServiceImpl();

		
		ArrayList<FriendWith> fwList = boardService.selectMyPageAccept(memberId);
		
		System.out.println(fwList);
		

		request.setAttribute("fwList", fwList);
		session.setAttribute("fwList", fwList);
//		request.getRequestDispatcher("/WEB-INF/views/member/myPage/myPageChatFriend.jsp").forward(request, response);
		
        // JSON 형식으로 변환하여 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(fwList));
	}

}
