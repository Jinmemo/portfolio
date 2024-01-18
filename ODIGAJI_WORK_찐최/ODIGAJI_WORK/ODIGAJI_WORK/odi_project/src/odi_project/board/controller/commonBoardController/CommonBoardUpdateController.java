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
import odi_project.board.model.vo.Board;

/**
 * Servlet implementation class CommonBoardUpdateController
 */
@WebServlet("/boardUpdate.bo")
public class CommonBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommonBoardUpdateController() {
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

        HttpSession session = request.getSession();

        String boardTitle = request.getParameter("boardTitle");
        String boardContent = request.getParameter("boardContent");
        String categoryNoString = request.getParameter("categoryNo");
        String bnoParam = request.getParameter("bno");
        int categoryNo = 0;
        int bno = 0; // bno 변수를 밖에서 선언

        // categoryNoString이 null이 아니면서 숫자로 구성되어 있다면 변환
        if (categoryNoString != null && !categoryNoString.isEmpty() && categoryNoString.matches("\\d+")) {
            categoryNo = Integer.parseInt(categoryNoString);
        }
        if (bnoParam != null && !bnoParam.isEmpty() && bnoParam.matches("\\d+")) {
            bno = Integer.parseInt(bnoParam);
        }

        String memberId = "ID004";

        Board board = new Board();
        board.setBoardNo(bno);
        board.setBoardTitle(boardTitle);
        board.setBoardContent(boardContent);
        board.setCategoryNo(String.valueOf(categoryNo));
        board.setMemberId(memberId);

        BoardService boardService = new BoardServiceImpl();
        int result = boardService.updateBoard(board);
        
        System.out.println(board);

        if (result > 0) {
            response.sendRedirect("detail.bo?bno=" + bnoParam);
        } else {
            session.setAttribute("alertMsg", "게시글 수정 실패");
            response.sendRedirect("commonlist.bo?bno=2");
        }
    }
}



