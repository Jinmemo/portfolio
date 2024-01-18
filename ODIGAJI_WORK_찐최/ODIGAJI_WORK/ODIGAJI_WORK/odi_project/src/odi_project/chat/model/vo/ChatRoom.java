package odi_project.chat.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class ChatRoom {
	
	private int chatNo;  // 시퀀스
	private String chatName; //채팅 이름
	private String chatCreater; // 사용자
	private int chatInCount;
	private Date chatCreateDate; // 날짜
	private String status; // 디폴트 y
	private int chatKey; // chatIn에서 넘겨줄 chatKey

	
}
