package odi_project.member.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.common.filter.HashUtil;
import odi_project.member.model.service.MemberServiceImpl;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberDeleteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/views/member/login/delete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// ...

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 회원 삭제 컨트롤러

		// 사용자가 입력한 비밀번호 가져오기
		String memberPwd = request.getParameter("memberPwd");

		// session에서 loginUser내에 있는 id값 가져오기
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");

		// 입력된 비밀번호를 해싱
		try {
			memberPwd = HashUtil.hashString(memberPwd);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			// 예외 처리 - 해싱 실패
			request.setAttribute("errorMsg", "비밀번호 해싱 중 오류가 발생했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			return;
		}

		Member m = Member.builder().memberId(loginUser.getMemberId()).memberPwd(memberPwd).build();

		int result = new MemberServiceImpl().deleteMember(m);

		if (result > 0) {
			// 회원 정보를 성공적으로 삭제한 경우
			session.setAttribute("alertMsg", "회원 탈퇴되었습니다");
			session.removeAttribute("loginUser");
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath());
		} else {
			// 회원 정보 삭제 실패 (비밀번호가 일치하지 않는 경우)
			request.setAttribute("errorMsg", "비밀번호가 일치하지 않아 회원 탈퇴를 할 수 없습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}
}