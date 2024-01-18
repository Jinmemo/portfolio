package odi_project.common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


public class PasswordEncryptWrapper extends HttpServletRequestWrapper{

	public PasswordEncryptWrapper(HttpServletRequest request) {
		super(request);
		
	}
	/*
	 * getParameter 메서드를 오버라이드하여 지정된 매개변수 memberPwd의 값을 가로채고 해당 값을 암호화 한다.
	 * */
	@Override
	public String getParameter(String name) {
		String value = "";
		
		//매개변수로 전달받은 name변수의 값이 userPwd일 경우 암호화하기
		if(name.equals("memberPwd")) {
			
			System.out.println("암호화 전 pwd : " + super.getParameter(name));
			//암호화 작업 SHA-512 해시 알고리즘을 사용하여 문자열 암호화하기
			value = getSHA512(super.getParameter(name));
			System.out.println("암호화 후 pwd : " + value);
		}else {
			value = super.getParameter(name);//전달받은 매개변수가 비밀번호가 아닐 경우 원래 가지고 있던 값 그대로 반환
			
		}
		return value;
	}
	
	
	private String getSHA512(String val) {
		
		//암호화 처리 객체 선언
		MessageDigest md = null;
		
		try {
			//사용할 암호화 알고리즘을 선택해서 객체 생성
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		//암호화시에는 BIT연산을 한다.
		md.update(val.getBytes(Charset.forName("UTF-8")));
		//비트연산한 결과값(byte[])을 String배열로 변환
		return Base64.getEncoder().encodeToString(md.digest());
		
	}
	
}