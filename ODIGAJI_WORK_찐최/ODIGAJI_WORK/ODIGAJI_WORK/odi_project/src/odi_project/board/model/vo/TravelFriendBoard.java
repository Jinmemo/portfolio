package odi_project.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

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
public class TravelFriendBoard {
	
	private int fboardNo;
	private String friendTitle;
	private String friendContent;
	private String friendCategory;
	private String friendAddress;
	private Date friendStartDate;
	private Date friendEndDate;
	private Date createDate;
	private String status;
	private String memberId;
	private String city;
	private String preAgeGroup;
	
	private ArrayList<Reply> list;  // 댓글 목록 저장할 예정
	
}
