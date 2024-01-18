package odi_project.board.controller.travelFestivalController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.TravelFestival;
import odi_project.common.model.vo.TFPageInfo;
import odi_project.common.model.vo.TFPagination;

/**
 * Servlet implementation class TFCategoryClickController
 */
@WebServlet("/tfCategoryClick.bo")
public class TFCategoryClickController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TFCategoryClickController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// doPost(request, response);
		List<String> selectedCategoryIds = new ArrayList<>();

		//널값 아닌 경우 list에 추갛
		String region = request.getParameter("region");
		if( region != null ) {
			selectedCategoryIds.add(region);
		}
		
		String season = request.getParameter("season");
		if( season != null ) {
			selectedCategoryIds.add(season);
		}
		
		String theme = request.getParameter("theme");
		if( theme != null ) {
			selectedCategoryIds.add(theme);
		}

		BoardService boardservice = new BoardServiceImpl();

		int searchCount = boardservice.travelCategoryClickListCount(selectedCategoryIds);
		String currentPageParam = request.getParameter("currentPage");// 현재 페이지
		int currentPage = (currentPageParam != null) ? Integer.parseInt(currentPageParam) : 1;
		int pageLimit = 5;
		int boardLimit = 12;
		TFPageInfo pi = TFPagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);

		ArrayList<TravelFestival> list = boardservice.travelCategoryClick(selectedCategoryIds, pi);

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		// 썸네일 가져오기 (없으면 사진이 없습니다 대체)
		list.stream().forEach(tf -> {

			ArrayList<String> travelImgList = tf.getTravelImg();

			if (travelImgList != null && !travelImgList.isEmpty()) {
				tf.setThumbNail(travelImgList.get(0));
			} else {
				tf.setThumbNail("./image/tfimage/사진이없습니다.jpg");
			}

		});
		
		// 카테고리 선택 유지 위해 넘겨주기
		request.setAttribute("selectedCategoryIds", String.join(", ", selectedCategoryIds));
		
		request.getRequestDispatcher("/WEB-INF/views/board/travelFestivalBoard/tfview.jsp").forward(request, response);
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String[] stringarray = request.getParameterValues("categoryIdsMap");
	    List<String> selectedCategoryIds = new ArrayList<>(Arrays.asList(stringarray));
	    
	    //ArrayList selectedCategoryIds = request.getParameterValues("categoryIdsMap");
	    //String[] selectedCategoryIds = request.getParameterValues("categoryIdsMap");
	    //String arrayString = String.join(", ", selectedCategoryIds); 
	    
	    BoardService boardservice = new BoardServiceImpl();
	    
	    int searchCount = boardservice.travelCategoryClickListCount(selectedCategoryIds);
	    String currentPageParam = request.getParameter("currentPage");//현재 페이지
		int currentPage = (currentPageParam != null) ? Integer.parseInt(currentPageParam) : 1;
		int pageLimit = 5;
		int boardLimit = 12;
		TFPageInfo pi = TFPagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<TravelFestival> list = boardservice.travelCategoryClick(selectedCategoryIds, pi);
	    
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		//썸네일 가져오기 (없으면 사진이 없습니다 대체)
		list.stream().forEach( tf -> {
			
			ArrayList<String> travelImgList = tf.getTravelImg();
			
			if (travelImgList != null && !travelImgList.isEmpty()) {
		        tf.setThumbNail(travelImgList.get(0));
			} else {
				tf.setThumbNail("./image/tfimage/사진이없습니다.jpg");
			}
		
		});
		
		request.setAttribute("selectedCategoryIds", String.join(", ", stringarray));
		
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/views/board/travelFestivalBoard/tfview.jsp").forward(request, response);
	    
	}
	    
	

}
