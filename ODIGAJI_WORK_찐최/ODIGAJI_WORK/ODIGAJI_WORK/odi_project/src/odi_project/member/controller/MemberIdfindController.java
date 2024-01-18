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
 * Servlet implementation class IdfidController
 */
@WebServlet("/idfind.me")
public class MemberIdfindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdfindController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/views/member/login/idfind.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원 아이디 찾기 컨트롤러
		
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Member m = Member.builder().memberName(memberName)
				.email(email)
				.phone(phone).build();
		
		Member idfind = new MemberServiceImpl().idfind(m);
		
		if(idfind == null) {
			request.getSession().setAttribute("alertMsg", "정보가 일치하지 않습니다.");
			
			response.sendRedirect(request.getContextPath() + "/idfind.me");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("idfind", idfind);
		}
		response.sendRedirect(request.getContextPath() + "/idfind.me");
	}
			
}
