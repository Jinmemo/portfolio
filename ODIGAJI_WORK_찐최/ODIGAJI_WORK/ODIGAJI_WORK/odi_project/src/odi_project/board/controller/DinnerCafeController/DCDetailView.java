package odi_project.board.controller.DinnerCafeController;

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
import odi_project.board.model.vo.DinnerCafe;

/** Servlet implementation class DCDetailView */
@WebServlet("/dcDetailView.bo")
public class DCDetailView extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /** @see HttpServlet#HttpServlet() */
    public DCDetailView() {
        super();
    }

    
	/** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardService service = new BoardServiceImpl();
		int dinnerNo = Integer.parseInt(request.getParameter("dinnerNo"));
		
		//조회수 증가
		int result = service.dcIncreaseCount(dinnerNo);
		HttpSession session = request.getSession();
		
		if(result > 0) {
			
			DinnerCafe dc = service.dinnerCafeDetailView(dinnerNo);
			
			//썸네일 가져오기 (없으면 사진이 없습니다 대체)
			ArrayList<String> dinnerImgList = dc.getDinnerImg();
			
			if (dinnerImgList != null && !dinnerImgList.isEmpty()) {
				dc.setThumbNail(dinnerImgList.get(0));
			} else {
				dc.setThumbNail("./image/dcimage/사진이없습니다.jpg");
			}
			
			request.setAttribute("dc", dc);
			request.getRequestDispatcher("WEB-INF/views/board/dinnerCafeBoard/dcDetailView.jsp").forward(request, response);
		} else {
			session.setAttribute("alertMsg", "맛집&카페 게시글 상세조회 실패");
			response.sendRedirect("dcview.bo");
		}
	}

	
	/** @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
