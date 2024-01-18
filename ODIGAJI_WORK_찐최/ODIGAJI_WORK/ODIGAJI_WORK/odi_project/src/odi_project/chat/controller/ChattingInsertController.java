package odi_project.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.chat.model.service.ChattingServiceImpl;
import odi_project.chat.model.vo.Chat;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class ChattingController
 */
@WebServlet("/chat.me")
public class ChattingInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChattingInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		String chatName = request.getParameter("chatName");

        // 세션에서 loginUser내에 있는 id값 가져오기
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        Chat c = Chat.builder()
                .memberId(loginUser.getMemberId())
                .memberName(loginUser.getMemberName())
                .chatName(chatName)
                .build();

        // createChat 메서드에서 반환된 Chat 객체를 가져와 세션에 저장
        ChattingServiceImpl chattingService = new ChattingServiceImpl();
        int result = chattingService.createChat(c);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/getChatInfo");
        } else {
            // 채팅 생성이 성공하지 않은 경우 처리
            // ...
        }
	    }
	}
