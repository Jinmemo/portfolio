package odi_project.board.controller.wishListController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.WishListDinner;
import odi_project.board.model.vo.WishListTravel;
import odi_project.member.model.vo.Member;

/**  Servlet implementation class wishListViewController */
@WebServlet("/wishlistview.bo")
public class wishListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/** @see HttpServlet#HttpServlet() */
	public wishListViewController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 	HttpSession session = request.getSession();
		 	
		    Member loginUser = (Member) session.getAttribute("loginUser");
		    
//		    로그인 안 되어 있을 때
		    if(loginUser == null) {
	
		    	String alertMsg = "로그인 후 이용가능합니다.";
		    	
		    	request.setAttribute("alertMsg", alertMsg);
				request.getSession().removeAttribute("alertMsg");
				request.getRequestDispatcher("WEB-INF/views/member/login/login.jsp").forward(request, response);
				;
		    }
		    else {
		    	
		    WishListTravel w = WishListTravel.builder()
		            .memberId(loginUser.getMemberId())
		            .build();
		    
		    List<WishListTravel> wishList = BoardServiceImpl.selectWishListe(w);
		    
		    Set<WishListTravel> wishSet = new HashSet<WishListTravel>(wishList);
		    wishList = new ArrayList(wishSet);
		    
		    BoardService service = new BoardServiceImpl();
		    request.setAttribute("wishList", wishList); 
		    	    

		    	WishListDinner w1 = WishListDinner.builder()
		    			.memberId(loginUser.getMemberId())
		    			.build();
		    	
		    	List<WishListDinner> wishdinner = BoardServiceImpl.selectwishdinner(w1);
		    	
		    	Set<WishListDinner> wishSett = new HashSet<WishListDinner>(wishdinner);
		    	wishdinner = new ArrayList(wishSett);
		    	
		    	
		    	request.setAttribute("wishdinner", wishdinner);
		    	
		    	 request.getRequestDispatcher("/WEB-INF/views/board/wishList.jsp").forward(request, response);
		   
		    }
	}

	/**  @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse  response)  */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        String alertMsg = "로그인 후 이용가능합니다.";
	        request.setAttribute("alertMsg", alertMsg);
	        request.getSession().removeAttribute("alertMsg");
	        request.getRequestDispatcher("WEB-INF/views/member/login/login.jsp").forward(request, response);
	    } else {
	        if (request.getParameter("travelName") != null) {
	            int travelNo = Integer.parseInt(request.getParameter("travelNo"));
	            String travelName = request.getParameter("travelName");

	            WishListTravel wt = WishListTravel.builder()
	                    .travelNo(travelNo)
	                    .travelName(travelName)
	                    .memberId(loginUser.getMemberId())
	                    .build();

	            // TravelFestival 객체 생성
	            int result = BoardServiceImpl.insertTravelF(wt);
	            
	        } else if (request.getParameter("dinnerName") != null) {
	            int dinnerNo = Integer.parseInt(request.getParameter("dinnerNo"));
	            String dinnerName = request.getParameter("dinnerName");

	            WishListDinner wt1 = WishListDinner.builder()
	                    .dinnerNo(dinnerNo)
	                    .dinnerName(dinnerName)
	                    .memberId(loginUser.getMemberId())
	                    .build();

	            int result = BoardServiceImpl.insertDinnerlF(wt1);
			}

		}
	}

}