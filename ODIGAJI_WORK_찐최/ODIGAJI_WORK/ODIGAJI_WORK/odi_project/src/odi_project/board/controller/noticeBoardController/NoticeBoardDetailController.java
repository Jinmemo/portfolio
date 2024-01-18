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
 * Servlet implementation class NoticeBoardDetailController
 */
@WebServlet("/noticedetail.bo")
public class NoticeBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeBoardDetailController() {
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
			Board b = service.noticeSelectBoard(bno);
//			System.out.println(b);
			request.setAttribute("b", b);
			
			request.getRequestDispatcher("WEB-INF/views/board/noticeBoard/noticeBoardDetailView.jsp").forward(request, response);
		} else {
			session.setAttribute("alertMsg", "게시글 상세조회 실패");
			response.sendRedirect("noticelist.bo?currentPage=1");
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
