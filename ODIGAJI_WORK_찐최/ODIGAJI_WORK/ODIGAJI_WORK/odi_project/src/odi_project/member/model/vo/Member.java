package odi_project.member.model.vo;



import java.util.Date;

import lombok.Builder;
import lombok.Data;

//@Getter
//@Setter
//@NoArgsConstructor  // 기본생성자
//@AllArgsConstructor // 매개변수 생성자
//@ToString
@Data
@Builder
/*	data 어노테이션은 위의 어노테이션을 한꺼번에 설정해주는 유용한 어노태이션이다.*/
public class Member {
	
	/*
	 *  CREATE TABLE MEMBER (
        MEMBER_ID VARCHAR2(20) PRIMARY KEY,  -- 아이디 
      	MEMBER_PWD VARCHAR2(20) NOT NULL,   -- 비밀번호
    	EMAIL VARCHAR2(20) NOT NULL,        -- 이메일 
    	MEMBER_NO VARCHAR2(20) NOT NULL,    -- 주민등록번호 
    	ADDRESS VARCHAR2(50) NOT NULL,      -- 주소
    	GENDER VARCHAR2(1) NOT NULL,        -- 성별  M-남자, F-여자 
    	MEMBER_PROFILE BLOB,                -- 프로필 이미지 
    	ABOUT_ME VARCHAR2(500),             -- 자기소개 
    	MEMBER_ACCESS NUMBER DEFAULT 1,     -- 회원권환 0-관리자, 1-회원 
    	CREATE_DATE DATE DEFAULT SYSDATE,   -- 회원가입일 
    	STATUS VARCHAR2(1) DEFAULT 'Y');      -- 회원삭제여부 DEFAULT :Y
	 * 
	 * */
	private String memberId;	// 아이디
	private String memberPwd;	//비밀번호
	private String email;		//이메일
	private String memberNo;	//주민등록번호
	private String address;		//주소
	private String gender;		//성별  M-남자, F-여자 
//	private byte[] memberProfile;// 프로필 이미지 
	private String aboutMe;		//
	private int memberAccess;	// 회원권환
	private Date createDate;	//회원가입일
	private String status;		//회원삭제여부
	private String memberName;  // 회원이름
	private String phone; 		// 핸드폰
	

}
