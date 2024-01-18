package odi_project.member.controller;


//로그아웃 컨트롤러
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/Logout.me")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// a태그를 통한 페이지 이동은 get으로 요청을 보내는 것.
		// 로그아웃 요청처리 -> session 데이터 만료시키기.

		
		// request.getSession().removeAttribute("loginUser")
		request.getSession().invalidate();
		// 이 메서드 호출하면 현재의 세션은 더 이상 유효하지 않게되며, 새로운 세션을 생성하거나 다른 세션과
		// 연결할때까지 클라이언트의 세션 정보는 삭제된다.
		

		
		// 응답 페이지는 메인페이지로 페이지 재요청 보내기
		response.sendRedirect(request.getContextPath()+ "/mainPage.bo");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
