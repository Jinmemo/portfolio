package odi_project.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.member.model.service.MemberServiceImpl;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class MemberChangePwdController
 */
@WebServlet("/changepwd.me")
public class MemberChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/views/member/login/passfind.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 비밀번호 변경 회원 정보 받기 + 비밀번호 변경 페이지로 이동
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
	
		Member m = Member.builder()
				.memberId(memberId)
				.memberName(memberName)
				.email(email)
				.build();
				
		Member updateMem = new MemberServiceImpl().updatePwdMember(m);
		
		if(updateMem == null) {
			request.setAttribute("alertMsg", "회원정보가 일치하지 않습니다.");
			
			response.sendRedirect(request.getContextPath() + "/changepwd.me");
		}else {
			
			HttpSession session = request.getSession();
			session.setAttribute("updateMem", updateMem);
			System.out.println(updateMem);
			// 수정된 부분: RequestDispatcher를 통한 포워딩
		    RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/login/pwdChange.jsp");
		    view.forward(request, response);
		}
	}

}
