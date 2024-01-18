package odi_project.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import odi_project.chat.model.service.ChattingServiceImpl;
import odi_project.chat.model.vo.Chat;

/**
 * Servlet implementation class ChattingDeleteController
 */
@WebServlet("/chatdelete.me")
public class ChattingDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChattingDeleteController() {
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
		
		String chatName = request.getParameter("chatName");
		
		Chat c = Chat.builder()
                .chatName(chatName)
                .build();
		
		ChattingServiceImpl chattingService = new ChattingServiceImpl();
		
		int result = chattingService.deleteChat(c);
		
		if (result > 0) {
			response.sendRedirect(request.getContextPath());
		} else {
		
	}

	}
}
