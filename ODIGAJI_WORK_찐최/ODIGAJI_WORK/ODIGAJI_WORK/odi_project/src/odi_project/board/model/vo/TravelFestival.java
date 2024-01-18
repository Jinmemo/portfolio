package odi_project.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString

public class TravelFestival {
	
	private int travelNo; //여행축제 식별자
	private String travelName;  //여행지이름
	private Date travelSdate; //시작날짜
	private Date travelEdate;//끝날짜
	private String travelContent; //내용
	private String travelAddress; //여행지주소
	private String typeTF; //Travel, Festival 구분
	private int reCount; //조회수
	private String status; //삭제상태
	private String memberId; //관리자아이다확인
	private Date editDate; //수정날짜
	private String theme; //테마
	private String region; //지역
	private String season; //계절
	
	private ArrayList<String> travelImg; //여행이미지 url
	private String thumbNail; //썸네일이미지
	
}
