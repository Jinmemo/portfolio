package odi_project.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
	private int chatId;
	private String content;
	private	String memberId; 
	private int chatKey;
}