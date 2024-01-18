package odi_project.chat.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.chat.model.service.ChattingServiceImpl;
import odi_project.chat.model.vo.Chat;
import odi_project.chat.model.vo.ChatRoom;
import odi_project.chat.model.vo.Message;
import odi_project.member.model.service.MemberServiceImpl;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class ChatInfoController
 */
@WebServlet("/ChatInfo")
public class ChatInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private static Map<String, Set<Integer>> userChatMap = new HashMap<>();
	   private static Map<Integer, Integer> chatInCountMap = new HashMap<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  // 클라이언트에서 전달받은 채팅 Key
	    int chatKey = Integer.parseInt(request.getParameter("chatKey"));
	    String chatName = request.getParameter("chatName");
	    String chatCreater = request.getParameter("memberName");
	    
	    System.out.println( "chatCreater" + ":" + chatCreater);

	    // 해당 사용자가 해당 채팅방에 이미 참여 중인지 확인
	    Set<Integer> chatsParticipated = userChatMap.getOrDefault(chatCreater, new HashSet<>());

	    if (!chatsParticipated.contains(chatKey)) {
	        // 해당 사용자가 해당 채팅방에 처음 참여하는 경우에만 사용자 수 증가
	        chatsParticipated.add(chatKey);
	        userChatMap.put(chatCreater, chatsParticipated);

	        // 해당 채팅방의 사용자 수 증가
	        int memberCount = chatInCountMap.getOrDefault(chatKey, 0) + 1;
	        chatInCountMap.put(chatKey, memberCount);

	        // 채팅방 정보를 이용한 작업 (예: 데이터베이스에 저장 등)
	        ChatRoom room = ChatRoom.builder()
	                .chatKey(chatKey)
	                .chatName(chatName)
	                .chatCreater(chatCreater)
	                .chatInCount(memberCount)
	                .build();

	        ChattingServiceImpl createChatRoom = new ChattingServiceImpl();
	        int result = createChatRoom.createChatRoom(room);
	    }

	     
	            // 클라이언트에서 전달받은 채팅 Key를 이용하여 해당 채팅 정보 조회 로직
	        	 String chatKeyString = request.getParameter("chatKey");
	     	    String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
	     	    // 채팅 Key를 정수로 변환
	     	    int chatKey1 = Integer.parseInt(chatKeyString);
	     	    
	     	    HttpSession session = request.getSession();
	     	    session.setAttribute("chatKey", chatKey1);
	     	    
	     	    ChattingServiceImpl chattingService = new ChattingServiceImpl();
	     		List<Message> msgList = chattingService.selectMsg(memberId,chatKey);
	     		
	     		System.out.println("msgList :" + msgList);
	     		
	     		request.setAttribute("msgList", msgList);
	     		

	     	    request.getRequestDispatcher("/WEB-INF/views/chat/liveChatRoom.jsp").forward(request, response);
	        }
	    
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
//		int chatKey = Integer.parseInt(request.getParameter("chatKey"));
//        String chatName = request.getParameter("chatName");
//        String memberName = request.getParameter("memberName");
//
//        // 해당 사용자가 해당 채팅방에 이미 참여 중인지 확인
//        Set<Integer> chatsParticipated = userChatMap.getOrDefault(memberName, new HashSet<>());
//
//        if (!chatsParticipated.contains(chatKey)) {
//            // 해당 사용자가 해당 채팅방에 처음 참여하는 경우에만 사용자 수 증가
//            chatsParticipated.add(chatKey);
//            userChatMap.put(memberName, chatsParticipated);
//
//            // 해당 채팅방의 사용자 수 증가
//            int memberCount = chatInCountMap.getOrDefault(chatKey, 0) + 1;
//            chatInCountMap.put(chatKey, memberCount);
//
//            // 채팅방 정보를 이용한 작업 (예: 데이터베이스에 저장 등)
//            ChatRoom room = ChatRoom.builder()
//                    .chatKey(chatKey)
//                    .chatName(chatName)
//                    .chatCreater(memberName)
//                    .chatInCount(memberCount)
//                    .build();
//
//            ChattingServiceImpl createChatRoom = new ChattingServiceImpl();
//            int result = createChatRoom.createChatRoom(room);
//
//            if (result > 0) {
//                // 채팅방 생성 및 사용자 수 증가 후의 값 출력 또는 다른 작업 수행
//                System.out.println("채팅방 사용자 수: " + memberCount);
//            }
//        }
    }
}