package odi_project.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder

public class FriendReply {
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private String secretReply;
	private String status;
	private String memberId;
	private int fboardNo;
	private String memberName;
}
