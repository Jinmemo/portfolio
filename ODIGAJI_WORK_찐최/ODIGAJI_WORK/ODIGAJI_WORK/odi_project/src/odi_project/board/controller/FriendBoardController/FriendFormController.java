package odi_project.board.controller.FriendBoardController;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.Category;
import odi_project.board.model.vo.TravelFriendBoard;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class TravelFriendFormController
 */
@WebServlet("/travelFriendForm.bo")
public class FriendFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Object memberId;
       

    public FriendFormController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Category> list = new BoardServiceImpl().selectFriendCategoryList();
		
		
		request.setAttribute("list", list);
	
		
		request.getRequestDispatcher("WEB-INF/views/board/friendBoard/travelFriendForm.jsp").forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String friendTitle = request.getParameter("title");
		String friendContent = request.getParameter("content");
		String friendCategory = request.getParameter("category");
		String friendAddress = request.getParameter("city");
		Date friendStartDate = Date.valueOf(request.getParameter("startDate"));
		Date friendEndDate = Date.valueOf(request.getParameter("endDate"));
		String memberId = ((Member) session.getAttribute("loginUser")).getMemberId();
		String preAgeGroup = request.getParameter("travel-age");

		System.out.println(memberId);
		
		
		TravelFriendBoard tfb = new TravelFriendBoard().builder()
					 	.friendTitle(friendTitle)
		                .friendContent(friendContent)
		                .friendCategory(friendCategory)
		                .friendAddress(friendAddress)
		                .friendStartDate(friendStartDate)
		                .friendEndDate(friendEndDate)
		                .preAgeGroup(preAgeGroup)
		                .memberId(memberId)  
		                .build();
		
		int result = new BoardServiceImpl().InsertFriendBoard(tfb);
		
		session.setAttribute("tfb", tfb);
		
		if(result > 0) { // 성공 
			session.setAttribute("alertMsg", "게시글 작성에 성공했습니다.");
			response.sendRedirect("friendSearch.bo");
			
//			response.sendRedirect("travelFriend.bo?currentPage=1");
		} else {
			session.setAttribute("errorMsg", "게시글 작성 실패!");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		

	}

}
