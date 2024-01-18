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
import odi_project.board.model.vo.FriendReply;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class FriendReplyUpdateController
 */
@WebServlet("/friendReplyUpdate.bo")
public class FriendReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FriendReplyUpdateController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("WEB-INF/views/board/friendBoard/FriendReplyUpdate.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		int fboardNo = Integer.parseInt(request.getParameter("fboardNo"));
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		
		System.out.println("replyNo : " + replyNo);
		
		String replyContent = request.getParameter("replyContent");
		String memberId = ((Member) session.getAttribute("loginUser")).getMemberId();
		
		
		FriendReply fr = new FriendReply().builder()
								.replyNo(replyNo)
								.replyContent(replyContent)
								.fboardNo(fboardNo)
								.memberId(memberId)
								.build();
		
		BoardService boardService = new BoardServiceImpl();
		
		int result = boardService.updateFriendReply(fr);
		
		if(result > 0) {
			
			request.setAttribute("fr", fr);
			session.setAttribute("alertMsg", "댓글 수정에 성공했습니다.");
			response.sendRedirect("friendDetail.bo?fboardNo="+fboardNo);
			response.getWriter().print(result);
		}else {
			session.setAttribute("errorMsg", "댓글 수정 실패!");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
		
		
		
	}

}
