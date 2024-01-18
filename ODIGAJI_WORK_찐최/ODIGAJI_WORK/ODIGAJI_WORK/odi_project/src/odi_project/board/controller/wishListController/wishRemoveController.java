package odi_project.board.controller.wishListController;

import java.io.IOException;

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

/**
 * Servlet implementation class wishRemoveController
 */
@WebServlet("/wishRemove.bo")
public class wishRemoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public wishRemoveController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardService boardService = new BoardServiceImpl();
		String[] travelWishKeys = request.getParameterValues("travelWishKeys");
		String[] dinnerWishKeys = request.getParameterValues("dinnerWishKeys");
		
		int result = 1;
		int result1 = 1;
		
		if (travelWishKeys != null && travelWishKeys.length > 0) {

			for (String twishKey : travelWishKeys) {
				int wishKey = Integer.parseInt(twishKey);
				result *= boardService.wishRemove(wishKey);
			}
			
		}

		if (dinnerWishKeys != null && dinnerWishKeys.length > 0) {

			System.out.println("dinner왜안되지");
			for (String dwishKey : dinnerWishKeys) {
				
				int wishKey = Integer.parseInt(dwishKey);
				System.out.println(wishKey);
				
				result1 *= boardService.dinnerwishRemove(wishKey);
			}
		}
		
		if (result > 0 && result1>0) { // 삭제 성공 시
			response.sendRedirect("wishlistview.bo");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "찜 삭제 실패");
			response.sendRedirect("wishlistview.bo");
		}
		

	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int wishKey = Integer.parseInt(request.getParameter("dinnerwishKey"));

		//WishListDinner wlt = new WishListDinner();

		BoardService boardService = new BoardServiceImpl();
		int result = boardService.dinnerwishRemove(wishKey);

		if (result > 0) { // 삭제 성공 시
			response.sendRedirect("wishlistview.bo");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "찜 삭제 실패");
			response.sendRedirect("wishlistview.bo");
		}

	}
}
