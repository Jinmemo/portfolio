package odi_project.member.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

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
 * Servlet implementation class MemberPwdUpdate
 */
@WebServlet("/recover.me")
public class MemberPwdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 비밀번호 변경 컨트롤러
		
		String memberPwd = request.getParameter("memberPwd");
		String memberPwdCheck = request.getParameter("memberPwdCheck");
		
		HttpSession session = request.getSession();
		Member updateMem = (Member) session.getAttribute("updateMem");
		
		
		if(!memberPwd.equals(memberPwdCheck)) {
			request.getSession();
		}else if(updateMem != null ) {
			try {
				String memberId = updateMem.getMemberId();
			
				Member m = Member.builder()
						.memberId(memberId)
						.memberPwd(HashUtil.hashString(memberPwd))
						.build();
			
				// 해시된 비밀번호로 업데이트
				int member = new MemberServiceImpl().pwdUpdate(m);
			
				session.setAttribute("member", member);
			
			
			response.sendRedirect(request.getContextPath() + "/login.me");
		} catch (NoSuchAlgorithmException e) {
	        e.printStackTrace(); // 예외 처리 필요 (예: 로깅 또는 사용자에게 알림)
		}
		}
	}

}
