package odi_project.board.controller.DinnerCafeController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.DinnerCafe;
import odi_project.common.model.vo.TFPageInfo;
import odi_project.common.model.vo.TFPagination;

/** Servlet implementation class TFViewController*/
@WebServlet("/dcview.bo")
public class DCViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /** @see HttpServlet#HttpServlet()  */
    public DCViewController() {
        super();
    }

	/** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
			BoardService service = new BoardServiceImpl();
			
			//-------- 페이징 처리 --------
			int listCount = service.selectDinnerListCount();
			String currentPageParam = request.getParameter("currentPage");
			int currentPage = (currentPageParam != null) ? Integer.parseInt(currentPageParam) : 1;
			int pageLimit = 5;
			int boardLimit = 12;
			
			TFPageInfo pi = TFPagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			ArrayList<DinnerCafe> list = service.selectDinnerList(pi);
			
			//썸네일
			list.stream().forEach( dc -> {
				
				ArrayList<String> dinnerImgList = dc.getDinnerImg();
				
				if (dinnerImgList != null && !dinnerImgList.isEmpty()) {
			        dc.setThumbNail(dinnerImgList.get(0));
				} else {
					dc.setThumbNail("./image/dcimage/사진이없습니다.jpg");
				}
			
			});
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/WEB-INF/views/board/dinnerCafeBoard/dcview.jsp").forward(request, response);
		}
		catch(Exception e) {
			  request.setAttribute("error", e.getMessage());
			  request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/** @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
