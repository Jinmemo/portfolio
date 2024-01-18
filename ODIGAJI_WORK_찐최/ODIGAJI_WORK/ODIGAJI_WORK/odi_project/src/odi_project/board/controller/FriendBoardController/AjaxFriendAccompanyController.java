package odi_project.board.controller.FriendBoardController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.board.model.service.BoardService;
import odi_project.board.model.service.BoardServiceImpl;
import odi_project.board.model.vo.FriendReply;
import odi_project.board.model.vo.FriendWith;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class AjaxFriendAccompanyController
 */
@WebServlet("/accompany.bo")
public class AjaxFriendAccompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFriendAccompanyController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		

		int fboardNo = Integer.parseInt(request.getParameter("fboardNo"));
		String friendTitle = request.getParameter("friendTitle");
		String memberId = ((Member) session.getAttribute("loginUser")).getMemberId();
		String memberName = ((Member) session.getAttribute("loginUser")).getMemberName();
		String memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		String aboutMe = ((Member) session.getAttribute("loginUser")).getAboutMe();
		String status = request.getParameter("status");
		String gender = ((Member) session.getAttribute("loginUser")).getGender();
		
		
//		System.out.println(fboardNo);
//		System.out.println(memberId);
//		System.out.println(memberName);
//		System.out.println(memberNo);
//		System.out.println(aboutMe);
//		System.out.println(status);
//		System.out.println(gender);
		
		FriendWith fw = new FriendWith().builder()
                .fboardNo(fboardNo)
                .memberId(memberId)
                .memberName(memberName)
                .memberNo(memberNo)
                .aboutMe(aboutMe)
                .status(status)
                .friendTitle(friendTitle)
                .gender(gender)
                .build();
		
		
		BoardService boardService = new BoardServiceImpl();
		
		
		request.setAttribute("fw", fw);
		session.setAttribute("fw", fw);
		
		if(status.equals("Y")) {

			int result = boardService.insertFriendWith(fw);

			response.getWriter().print(result);

		}else {
			fw.setStatus("N");
			int result = boardService.deleteFriendWith(fw);
			request.setAttribute("fw", fw);
			response.getWriter().print(result);
		}
		

		
	}

}
