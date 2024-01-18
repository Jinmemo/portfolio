package odi_project.member.controller.MyPageChatFriend;

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
import odi_project.board.model.vo.FriendWith;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class MemberMyPageChatFriendController
 */
@WebServlet("/myPageChatFriend.me")
public class MyPageChatFriendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyPageChatFriendController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) { // 로그인 정보가 없다? 로그인전.
			session.setAttribute("alertMsg", "로그인 후 이용해주세요"); // alert 팝업창 추가
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("loginUser", session.getAttribute("loginUser"));
			System.out.println(session.getAttribute("loginUser"));
			String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
			BoardService boardService = new BoardServiceImpl();
			
			ArrayList<FriendWith> fwList = boardService.selectMyPageAccept(memberId);
			request.setAttribute("fwList", fwList);
			request.getRequestDispatcher("WEB-INF/views/member/myPage/myPageChatFriend.jsp").forward(request,response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
