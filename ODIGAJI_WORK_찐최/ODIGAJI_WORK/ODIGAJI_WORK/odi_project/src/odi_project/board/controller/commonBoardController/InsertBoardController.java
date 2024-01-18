package odi_project.board.controller.commonBoardController;

import java.io.IOException;
import java.util.Enumeration;

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
 * Servlet implementation class InsertBoardController
 */
@WebServlet("/insertboard.bo")
public class InsertBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertBoardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		//request.setCharacterEncoding("UTF-8");
	    HttpSession session = request.getSession();

	    // 폼에서 매개변수 추출
	    String boardTitle = request.getParameter("boardTitle");
	    String boardContent = request.getParameter("boardContent");
	    String categoryNoString = request.getParameter("categoryNo");
	    String memberId = request.getParameter("memberId");
	    int categoryNo = 0;

	    // categoryNoString이 null이 아니면서 숫자로 구성되어 있다면 변환
	    if (categoryNoString != null && categoryNoString.matches("\\d+")) {
	        categoryNo = Integer.parseInt(categoryNoString);
	    }

	    // 폼 데이터를 사용하여 Board 객체 생성
	    Board board = new Board();
	    board.setBoardTitle(boardTitle);
	    board.setBoardContent(boardContent);
	    board.setCategoryNo(categoryNoString);
	    board.setMemberId(memberId);
	    
	    System.out.println(board);

	    // 서비스를 호출하여 새로운 게시글 추가
	    BoardService boardService = new BoardServiceImpl();
	    int result = boardService.insertBoard(board);

	    if (result > 0) {
	        // 성공적인 추가 시, 성공 페이지로 리디렉션
	        response.sendRedirect("commonlist.bo?bno=1");
	    } else {
	        // 추가 실패
	        session.setAttribute("alertMsg", "게시글 작성실패");
	        response.sendRedirect("commonlist.bo?bno=1");
	    }
	}
}
