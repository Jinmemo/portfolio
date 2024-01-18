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
 * Servlet implementation class CommonBoardDetailController
 */
@WebServlet("/detail.bo")
public class CommonBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommonBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardServiceImpl();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = service.increaseCount(bno);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			Board b = service.selectBoard(bno);
//			System.out.println(b);
			request.setAttribute("b", b);
			request.getRequestDispatcher("WEB-INF/views/board/commonBoard/commonBoardDetailView.jsp").forward(request, response);
		} else {
			session.setAttribute("alertMsg", "게시글 상세조회 실패");
			response.sendRedirect("commonlist.bo?currentPage=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
