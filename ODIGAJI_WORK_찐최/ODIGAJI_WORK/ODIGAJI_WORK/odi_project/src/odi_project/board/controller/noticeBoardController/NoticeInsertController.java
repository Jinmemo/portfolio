package odi_project.board.controller.noticeBoardController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.Board;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/noticeInsert.bo")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		//request.setCharacterEncoding("UTF-8");
	    HttpSession session = request.getSession();

	    // 폼에서 매개변수 추출
	    String boardTitle = request.getParameter("boardTitle");
	    String boardContent = request.getParameter("boardContent");
	    String memberId = request.getParameter("memberId");

	    // 'ID004'가 memberId라고 가정
	

	    // 폼 데이터를 사용하여 Board 객체 생성
	    Board board = new Board();
	    board.setBoardTitle(boardTitle);
	    board.setBoardContent(boardContent);
	    board.setMemberId(memberId);

	    // 서비스를 호출하여 새로운 게시글 추가
	    BoardService boardService = new BoardServiceImpl();
	    int result = boardService.noticeInsertBoard(board);

	    if (result > 0) {
	        // 성공적인 추가 시, 성공 페이지로 리디렉션
	        response.sendRedirect("noticelist.bo?bno=1");
	    } else {
	        // 추가 실패
	        session.setAttribute("alertMsg", "게시글 작성실패");
	        response.sendRedirect("noticelist.bo?bno=1");
	    }
	}

}
