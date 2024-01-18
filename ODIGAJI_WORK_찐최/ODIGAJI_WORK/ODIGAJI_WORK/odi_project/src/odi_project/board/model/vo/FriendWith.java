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

public class FriendWith {
	
	private int withNo;
	private int fboardNo;
	private String memberId;
	private String memberName;
	private String memberNo;
	private String aboutMe;
	private String status;
	private String accept;
	private String friendTitle;
	private String gender;
}
