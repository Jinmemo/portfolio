package odi_project.chat.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;
import odi_project.member.model.vo.Member;

@Data
@Builder
public class Chat {
	
	private int chatKey;
	private String chatName;
	private String memberId;
	private String memberName;
	

}
