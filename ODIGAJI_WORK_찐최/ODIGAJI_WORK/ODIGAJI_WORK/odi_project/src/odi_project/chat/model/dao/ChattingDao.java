package odi_project.chat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import odi_project.chat.model.vo.Chat;
import odi_project.chat.model.vo.ChatRoom;
import odi_project.chat.model.vo.Message;
import odi_project.member.model.vo.Member;

public class ChattingDao {

	public static int createChat(SqlSession sqlSession, Chat c) {
		
		return sqlSession.insert("chatMapper.insertChat", c);
	}

	public static List<Chat> selectChat(SqlSession sqlSession, Chat c) {
	    
		return sqlSession.selectList("chatMapper.selectChat", c);
	}

	public static List<Chat> selectChatAll(SqlSession sqlSession) {
		
	    return sqlSession.selectList("chatMapper.selectChatAll");
	}

	public static Map<String, Object> ChatListSelect(SqlSession sqlSession, Chat c) {
	    return sqlSession.selectOne("chatMapper.ChatListSelect", c);
	}

	public static int deleteChat(SqlSession sqlSession, Chat c) {
		
		 return sqlSession.update("chatMapper.deleteChat", c);
	}

	public static int createChatRoom(SqlSession sqlSession, ChatRoom room) {
		System.out.println(room);
		return sqlSession.insert("chatMapper.createChatRoom" , room);
	}

	public static List<Message> selectMsg(SqlSession sqlSession, String memberId,  int chatKey) {
	    Map<String, Object> Msg = new HashMap<>();
	    Msg.put("memberId", memberId);
	    Msg.put("chatKey", chatKey);
		return sqlSession.selectList("chatMapper.selectMsg", Msg);
	}

	public static int insertMsg(SqlSession sqlSession, Message msg) {
		return sqlSession.insert("chatMapper.insertMsg", msg);
	}
}
