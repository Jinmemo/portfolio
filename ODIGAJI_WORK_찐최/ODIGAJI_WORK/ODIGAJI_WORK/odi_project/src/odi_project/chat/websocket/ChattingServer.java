package odi_project.chat.websocket;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import odi_project.chat.model.service.ChattingServiceImpl;
import odi_project.chat.model.vo.Message;
import odi_project.member.model.vo.Member;

@ServerEndpoint(value="/chatting.do" ,
decoders = {JsonDecoder.class},
encoders = {JsonEncoder.class}, 
configurator = HttpSessionConfigurator.class
)
public class ChattingServer {
	
	@OnOpen 
	public void open(Session session, EndpointConfig config) {
		HttpSession httpSession = (HttpSession) config.getUserProperties().get("session");
		Member m = (Member)httpSession.getAttribute("loginUser");
		int chatKey = (int)httpSession.getAttribute("chatKey");
		
		session.getUserProperties().put("loginUser", m);
		session.getUserProperties().put("chatKey", chatKey);
		
		System.out.println("클라이언트 접속..." + session.getId());
	}
	
	// 클라이언트에서 보내는 메세지를 처리하는 메소드
	@OnMessage
	public void message(Session session, Message msg) { 
		
		// 요청받았을때 db에 채팅데이터 추가
		new ChattingServiceImpl().insertMessage(msg);
		Set<Session> clinets = session.getOpenSessions();
		for (Session s : clinets) {
			
			Member loginUser = (Member)s.getUserProperties().get("loginUser");
			if(loginUser != null) {
				int 접속중인사용자_채팅방번호 = (int)s.getUserProperties().get("chatKey");
				int 채팅방번호 = msg.getChatKey();
				if(접속중인사용자_채팅방번호 == 채팅방번호) {
					try {
						s.getBasicRemote().sendObject(msg);						
					} catch (IOException | EncodeException e) {
						e.printStackTrace();
					}
				}
				
			}
		}
	}
}

