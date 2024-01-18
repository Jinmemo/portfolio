package odi_project.member.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.common.AESCryptor;
import odi_project.common.filter.HashUtil;
import odi_project.member.model.service.MemberServiceImpl;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String alertMsg = (String) request.getSession().getAttribute("alertMsg");

		// 로그인 실패 메시지가 있다면 출력
		if (alertMsg != null) {
			request.setAttribute("alertMsg", alertMsg);
			request.getSession().removeAttribute("alertMsg");
		}

		request.getRequestDispatcher("WEB-INF/views/member/login/login.jsp").forward(request, response);
		;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//로그인 컨트롤러
		
		// 로그인 전에 각 버튼에 따라 페이지 이동
		String buttonType = request.getParameter("buttonType");
		if ("singup".equals(buttonType)) {
			response.sendRedirect(request.getContextPath() + "/singup.me");
		} else if ("idfind".equals(buttonType)) {
			response.sendRedirect(request.getContextPath() + "/idfind.me");
		} else if ("passwordfind".equals(buttonType)) {
			response.sendRedirect(request.getContextPath() + "/changepwd.me");
		} else {
			// 로그인 처리
			Member m = Member.builder().memberId(request.getParameter("memberId"))
					.memberPwd(request.getParameter("memberPwd")).build();
			
			try {
				m.setMemberPwd(HashUtil.hashString(request.getParameter("memberPwd")));
				
				Member loginUser = new MemberServiceImpl().loginMember(m);
			if (loginUser == null) {
				request.getSession().setAttribute("alertMsg", "로그인 실패");
				
				response.sendRedirect(request.getContextPath() + "/login.me");
				
			} else {
				// 양방향이라 사용 안함.
//				loginUser.setMemberPwd(AESCryptor.decrypt(loginUser.getMemberPwd())); // 이메일값 복호화 저장
				HttpSession session = request.getSession();
				
				session.setAttribute("loginUser", loginUser);
				// 로그인 성공 시 메인 페이지로 리다이렉트
				response.sendRedirect(request.getContextPath() + "/mainPage.bo");

			}
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
}
}
