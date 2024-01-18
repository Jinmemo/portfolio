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
import odi_project.chat.model.vo.Chat;

/**
 * Servlet implementation class ChattingInfoController
 */
@WebServlet("/getChatInfo")	
public class ChattingInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChattingInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모든 채팅 정보를 가져와 세션에 저장
        ChattingServiceImpl chattingService = new ChattingServiceImpl();
        List<Chat> chatList = chattingService.selectChatAll();

        HttpSession session = request.getSession();
        session.setAttribute("chatList", chatList);

     // 채팅 목록을 JSP로 전달
        request.getRequestDispatcher("/WEB-INF/views/chat/liveChat.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
