package odi_project.chat.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.chat.model.service.ChattingServiceImpl;
import odi_project.chat.model.vo.Message;

/**
 * Servlet implementation class ChatMsgListController
 */
@WebServlet("/msgList.bo")
public class ChatMsgListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChatMsgListController() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		String memberId = request.getParameter("memberId");
//		String content	= request.getParameter("content"); 
//		int chatKey = Integer.parseInt(request.getParameter("chatKey"));
//
//		
//		ChattingServiceImpl chattingService = new ChattingServiceImpl();
//		List<Message> msgList = chattingService.selectMsg(memberId,chatKey);
//		
//		System.out.println("msgList :" + msgList);
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("msgList", msgList);
		
		
//		request.getRequestDispatcher("/WEB-INF/views/chat/liveChatRoom.jsp").forward(request, response);

	}

}
