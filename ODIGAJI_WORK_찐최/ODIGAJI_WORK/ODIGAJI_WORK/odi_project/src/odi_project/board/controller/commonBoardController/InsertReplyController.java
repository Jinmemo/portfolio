package odi_project.board.controller.commonBoardController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.Reply;

/**
 * Servlet implementation class ReplyController
 */
@WebServlet("/insertReply.bo")
public class InsertReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertReplyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

		//request.setCharacterEncoding("UTF-8");
		
	    HttpSession session = request.getSession();


	    try {
	    	// boardNo 파라미터 값을 받아옴
	        String boardNoParam = request.getParameter("boardNo");
	        String replyContent = request.getParameter("replyContent");
	        
	        if (boardNoParam != null) {
	            int boardNo = Integer.parseInt(boardNoParam);
	            
	            // memberId 파라미터 값을 받아옴
	            String memberId = request.getParameter("memberId");

	            // 댓글 객체 생성
	            Reply reply = new Reply();
	            reply.setBoardNo(boardNo);
	            reply.setReplyContent(replyContent);
	            reply.setMemberId(memberId);
	            
	            System.out.println(reply);

	            // BoardService를 통해 댓글 작성
	            BoardService boardService = new BoardServiceImpl();
	            int result = boardService.insertReply(reply);

	            if (result > 0) {
	                // 댓글 작성 성공 시
	                response.sendRedirect("detail.bo?bno=" + boardNo);
	            } else {
	                // 댓글 작성 실패 시
	                // 실패 처리를 원하는 방식으로 구현
	                session.setAttribute("alertMsg", "댓글 작성 실패");
	                response.sendRedirect("detail.bo?bno=" + boardNo);
	            }
	        } else {
	            // boardNoParam이 비어있는 경우 예외 처리
	            session.setAttribute("alertMsg", "게시물 번호가 없습니다.");
	            System.out.println("실패1");
	            response.sendRedirect("detail.bo?bno=1");
	        }
	    } catch (NumberFormatException e) {
	        // 숫자로 변환할 수 없는 경우 예외 처리
	        session.setAttribute("alertMsg", "게시물 번호가 올바르지 않습니다.");
	        // 에러 처리 방식을 구현
	        System.out.println("실패2");
	        response.sendRedirect("detail.bo?bno=1");
	    }

	}


	}


