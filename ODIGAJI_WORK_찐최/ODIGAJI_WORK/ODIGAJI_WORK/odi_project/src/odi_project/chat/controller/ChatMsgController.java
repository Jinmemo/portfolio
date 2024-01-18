/*
 * package odi_project.chat.controller;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import odi_project.chat.model.dao.ChattingDao; import
 * odi_project.chat.model.service.ChattingService; import
 * odi_project.chat.model.service.ChattingServiceImpl; import
 * odi_project.chat.model.vo.Message; import odi_project.member.model.vo.Member;
 * 
 *//**
	 * Servlet implementation class ChatMsgController
	 */
/*
 * @WebServlet("/chatmsg.bo") public class ChatMsgController extends HttpServlet
 * { private static final long serialVersionUID = 1L;
 * 
 *//**
	 * @see HttpServlet#HttpServlet()
	 */
/*
 * public ChatMsgController() { super(); // TODO Auto-generated constructor stub
 * }
 * 
 *//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
/*
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { // TODO Auto-generated
 * method stub
 * response.getWriter().append("Served at: ").append(request.getContextPath());
 * }
 * 
 *//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { try { // 사용자로부터의 입력 파라미터를
		 * 받아온다. int chatId = Integer.parseInt(request.getParameter("chatId")); String
		 * content = request.getParameter("content"); String memberId =
		 * request.getParameter("memberId"); int chatKey =
		 * Integer.parseInt(request.getParameter("chatKey"));
		 * 
		 * 
		 * // 세션에서 loginUser내에 있는 id값 가져오기 HttpSession session = request.getSession();
		 * // Member memberId = (Member) session.getAttribute("loginUser");
		 * 
		 * // ChatMessage 객체를 생성하여 값을 설정한다. Message message = new Message();
		 * message.setChatId(chatId); message.setContent(content);
		 * message.setMemberId(memberId); message.setChatKey(chatKey);
		 * 
		 * System.out.println("chatId: " + chatId ); System.out.println("content: " +
		 * content ); System.out.println("memberId: " + memberId );
		 * System.out.println("chatKey: " + chatKey );
		 * 
		 * // MyBatis를 사용하여 메시지를 저장한다. ChattingServiceImpl chattingService = new
		 * ChattingServiceImpl(); int result = chattingService.insertMessage(message);
		 * 
		 * if(result > 0) { System.out.println("메세지 db 추가 완료");
		 * request.getRequestDispatcher("/WEB-INF/views/chat/liveChatRoom.jsp").forward(
		 * request, response); }
		 * 
		 * 
		 * } catch (NumberFormatException e) { // 숫자로 변환할 수 없는 값이 들어왔을 때의 예외 처리
		 * response.getWriter().write("Invalid input values"); } }
		 * 
		 * 
		 * }
		 */