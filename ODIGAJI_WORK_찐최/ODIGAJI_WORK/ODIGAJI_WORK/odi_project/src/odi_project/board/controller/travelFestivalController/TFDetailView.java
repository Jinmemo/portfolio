package odi_project.board.controller.travelFestivalController;

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
import odi_project.board.model.vo.TravelFestival;

/** Servlet implementation class TFDetailView */
@WebServlet("/tfDetailView.bo")
public class TFDetailView extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /** @see HttpServlet#HttpServlet() */
    public TFDetailView() {
        super();
    }

    
	/** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardService service = new BoardServiceImpl();
		int travelNo = Integer.parseInt(request.getParameter("travelNo"));
		
		//조회수 증가
		int result = service.tfincreaseCount(travelNo);
		HttpSession session = request.getSession();
		
		if(result > 0) {
			
			TravelFestival tf = service.travelFestivalDetailView(travelNo);
			
			//썸네일 가져오기 (없으면 사진이 없습니다 대체)
			ArrayList<String> travelImgList = tf.getTravelImg();

			if (travelImgList != null && !travelImgList.isEmpty()) {
				tf.setThumbNail(travelImgList.get(0));
			} else {
				tf.setThumbNail("./image/tfimage/사진이없습니다.jpg");
			}
			
			request.setAttribute("tf", tf);
			request.getRequestDispatcher("WEB-INF/views/board/travelFestivalBoard/tfDetailView.jsp").forward(request, response);
		} else {
			session.setAttribute("alertMsg", "여행지&축제 게시글 상세조회 실패");
			response.sendRedirect("tfview.bo");
		}
	}

	
	/** @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
