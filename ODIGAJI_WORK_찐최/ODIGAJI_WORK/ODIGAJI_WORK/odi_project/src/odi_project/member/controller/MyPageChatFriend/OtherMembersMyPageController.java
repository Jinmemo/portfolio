package odi_project.member.controller.MyPageChatFriend;

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
import odi_project.board.model.vo.FriendWith;
import odi_project.board.model.vo.TravelFriendCategory;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class OtherMembersMyPageController
 */
@WebServlet("/otherMembersMyPage.me")
public class OtherMembersMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OtherMembersMyPageController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String memberId = request.getParameter("memberId");
//		String memberName = request.getParameter("memberName");
//		String memberNo = request.getParameter("memberNo");
//		String aboutMe = request.getParameter("aboutMe");
//		
//		BoardService boardService = new BoardServiceImpl();
//		
//
//		
//		FriendWith fw = new FriendWith().builder()
//							.memberId(memberId)
//							.memberName(memberName)
//							.memberNo(memberNo)
//							.aboutMe(aboutMe)
//							.build();
//		
//		ArrayList<FriendWith> fwList = boardService.selectOtherMembersMyPage(fw);
//		
//		request.setAttribute("fwList", fwList);
//		System.out.println(fw);
//		
//		request.getRequestDispatcher("WEB-INF/views/member/myPage/OtherMembersMyPage.jsp").forward(request, response);
//		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String memberId = request.getParameter("memberId");
        String memberName = request.getParameter("memberName");
        String memberNo = request.getParameter("memberNo");
        String aboutMe = request.getParameter("aboutMe");
        String gender = request.getParameter("gender");
			

		
		BoardService boardService = new BoardServiceImpl();
		

		
		FriendWith fw = new FriendWith().builder()
							.memberId(memberId)
							.memberName(memberName)
							.memberNo(memberNo)
							.aboutMe(aboutMe)
							.gender(gender)
							.build();
		
		ArrayList<FriendWith> fwList = boardService.selectOtherMembersMyPage(fw);
		
		request.setAttribute("fwList", fwList);
		System.out.println("fwLIst" + fwList);

		request.getRequestDispatcher("WEB-INF/views/member/myPage/OtherMembersMyPage.jsp").forward(request, response);
	
		
	}

}
