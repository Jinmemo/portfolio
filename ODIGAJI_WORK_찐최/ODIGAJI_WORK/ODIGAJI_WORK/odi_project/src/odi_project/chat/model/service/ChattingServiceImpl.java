package odi_project.chat.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import odi_project.chat.model.dao.ChattingDao;
import odi_project.chat.model.vo.Chat;
import odi_project.chat.model.vo.ChatRoom;
import odi_project.chat.model.vo.Message;
import odi_project.common.template.Template;
import odi_project.member.model.vo.Member;

public class ChattingServiceImpl {

	public int createChat(Chat c) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = ChattingDao.createChat(sqlSession, c);
		
		if (result > 0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		
		sqlSession.close();

		return result;
	}

	public List<Chat> selectChat(Chat c) {
	    SqlSession sqlSession = Template.getSqlSession();
	    
	    List<Chat> result = (List<Chat>) ChattingDao.selectChat(sqlSession, c);
	    
	    sqlSession.close();
	    
	    return result;
	}

	public List<Chat> selectChatAll() {
	    SqlSession sqlSession = Template.getSqlSession();
	    
	    List<Chat> result = ChattingDao.selectChatAll(sqlSession);
	    
	    sqlSession.close();
	    
	    return result;
	}

	public static Map<String, Object> ChatListSelect(Chat c) {
		 
		SqlSession sqlSession = Template.getSqlSession();
		
		Map<String, Object> result = ChattingDao.ChatListSelect(sqlSession, c);
		
		sqlSession.close();

		return result;
	}

	public int deleteChat(Chat c) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = ChattingDao.deleteChat(sqlSession, c);
		
		if (result > 0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		
		sqlSession.close();

		return result;
	}

	public int createChatRoom(ChatRoom room) {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = ChattingDao.createChatRoom(sqlSession, room);
		
		if(result > 0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	public List<Message> selectMsg(String memberId, int chatKey) {
		SqlSession sqlSession = Template.getSqlSession();
		
		 List<Message> result = ChattingDao.selectMsg(sqlSession,memberId,chatKey);
		
		 sqlSession.close();
		 
		return result;
	}

	public int insertMessage(Message msg) {
		 
		
		 SqlSession sqlSession = Template.getSqlSession();
		  
		  int result = ChattingDao.insertMsg(sqlSession, msg);
		  
		  if (result > 0) { 
			  sqlSession.commit(); 
		  
		  }else { 
			  sqlSession.rollback();
			  
		  }
		  sqlSession.close();
		  
		  return result;
		  
	}
		
}

	/*
	 * public int insertMessage(Message message) { SqlSession sqlSession =
	 * Template.getSqlSession();
	 * 
	 * int result = ChattingDao.insertMsg(sqlSession, message);
	 * 
	 * if (result > 0) { sqlSession.commit(); }else { sqlSession.rollback(); }
	 * 
	 * sqlSession.close();
	 * 
	 * return result; }
	 */
	
	
