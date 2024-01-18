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
@ToString
@Builder

public class Board {
	
	private int boardNo; //식별자
	private String boardTitle; //제목
	private String boardContent; //내용
	private Date createDate; //작성일
	private int boardType; //게시글 타입 -공지/일반/여행친구
	private int count; //조회수
	private String status; //삭제상태
	private String memberId; //작성자 id
	private String categoryNo; //카테고리번호 (카테고리테이블과 연결)
	private int categoryType; //카테고리 타입 
	
	private String categoryName; //Category 테이블 칼럼
	
	private ArrayList<Reply> list; //댓글
 
	/*
	 * public String getCategoryNo() { return categoryNo; }
	 */
	
	
	
}
