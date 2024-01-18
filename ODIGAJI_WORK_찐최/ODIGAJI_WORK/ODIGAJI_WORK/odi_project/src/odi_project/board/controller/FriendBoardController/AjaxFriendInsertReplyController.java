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
import odi_project.board.model.vo.TravelFriendCategory;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class FriendInsertReplyController
 */
@WebServlet("/friendInsert.re")
public class AjaxFriendInsertReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxFriendInsertReplyController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String replyContent = request.getParameter("replyContent");
		String secretReply = request.getParameter("secretReply");
		String memberId = ((Member) session.getAttribute("loginUser")).getMemberId();
		int fboardNo = Integer.parseInt(request.getParameter("fboardNo"));
		String memberName = ((Member) session.getAttribute("loginUser")).getMemberName();
		
		
		
		
		System.out.println(replyContent);
		System.out.println(secretReply);
		System.out.println(fboardNo);
		System.out.println(memberId);
		System.out.println(memberName);
		
		FriendReply fr = new FriendReply().builder()
                .replyContent(replyContent)
                .secretReply(secretReply)
                .memberId(memberId)
                .fboardNo(fboardNo)
                .memberName(memberName)
                .build();
		
		
		BoardService boardService = new BoardServiceImpl();
		
		int result = boardService.insertFriendReply(fr);
		

		
		response.getWriter().print(result);
		
		
	}

}
