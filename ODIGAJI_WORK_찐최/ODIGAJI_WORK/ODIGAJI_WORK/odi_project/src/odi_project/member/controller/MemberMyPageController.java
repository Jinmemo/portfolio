package odi_project.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.member.model.service.MemberServiceImpl;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class myPageController
 */
@WebServlet("/myPage.me")
public class MemberMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberMyPageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) { // 로그인 정보가 없다? 로그인전.
			session.setAttribute("alertMsg", "로그인 후 이용해주세요"); // alert 팝업창 추가
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("loginUser", session.getAttribute("loginUser"));
			System.out.println(session.getAttribute("loginUser"));
			request.getRequestDispatcher("WEB-INF/views/member/login/mypage.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		// 마이페이지 컨트롤러
		
		// 로그인 전에 각 버튼에 따라 페이지 이동
		String buttonType = request.getParameter("buttonType");
		if ("memberdelete".equals(buttonType)) {
			response.sendRedirect(request.getContextPath() + "/delete.me");
		} else if ("memberupdate".equals(buttonType)) {
			response.sendRedirect(request.getContextPath() + "/update.me");
		} else if ("chatromm".equals(buttonType)) {
			response.sendRedirect(request.getContextPath() + "/myPageChatFriend.me");
		} else {
			
		}
	}

}
