package odi_project.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
// 양방향 암호화 지원 클래스
// java.api에서 제공하고 있음
public class AESCryptor {
	
	private static SecretKey key; // 암호화를 위한 키
	private String path; // 암호화키 저장된 경로
	
	public AESCryptor() {
		// 인스턴스화 될 때 기본설정 추가
		// 1. key파일이 있다면 key파일에서 SecretKey객체를 불러오고,
		// 	  key가 없다면 SecretKey 객체를 생성하여 파일로 저장
		
		// 경로 우리가 임의로 지정하기
		this.path = AESCryptor.class.getResource("/").getPath(); // classes 바로 아래를 의미
		// C:\odi_project\odi_project\WebContent\WEB-INF\classes
		
		this.path = this.path.substring(0, this.path.indexOf("classes"));
		// C:\MyBastiWorkSpace\MyBatisProject\WebContent\WEB-INF\
		
		File f = new File(this.path+"/mkm.mk");
		//key를 저장하고 있는 파일 이름이 mkm.mk 임 -> SecretKey객체를 저장시킬 예정
				
		if(f.exists()) { //key를 저장하는 파일이 있다면
			
			try {
				ObjectInputStream ois = new ObjectInputStream(new FileInputStream(f));
				//ObjectInputStream은 보조스트림이기 때문에 FileInputStream 필요
				
				this.key = (SecretKey)ois.readObject(); //object로 반환되기 때문에 다운캐스팅
				
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}else {
			//파일이 없다면 파일생성 후 내부에 SecretKey객체 추가
			if(key == null) {
				//key값 생성해주는 메서드
				getGenerator();
			}
		}
	}
	private void getGenerator() {
		//SecretKey를 생성하는 객체
		SecureRandom ser = new SecureRandom();
		
		//key를 생성해주는 클래스
		KeyGenerator keygen = null;
		
		try {
			// 1. 적용할 알고리즘 AES => AES알고리즘은 키가 한개 필요함
			keygen = KeyGenerator.getInstance("AES");
			
			keygen.init(128, ser); //keygen을 통해 secretkey가 초기화 되고 설정까지 완료
			
			this.key = keygen.generateKey(); //secretkey 반환
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 생성된 키 객체를 mkm.mk파일에 저장
		File f = new File(this.path+ "/mkm.mk");
		
		try {
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f));
			//객체릉 출력할거니까 objectoutputstream을 이용, 파일 출력할거니까 fileoutput 쓰고 매개변수로 f넣기
			
			oos.writeObject(this.key); //매개변수로 key값넣어서 입력
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String encrypt(String str) { //암호화 시키는 매서드, 암호화 시키려는 str 받기
		
		String resultValue= ""; //암호화 값 넣을 변수 생성
		
		//key를 가지고 암호화처리하는 클래스 (Cipher)
		try {
			Cipher cipher = Cipher.getInstance("AES");  //변환시켜주고자 하는 알고리즘 - AES
			
			cipher.init(Cipher.ENCRYPT_MODE, AESCryptor.key);
			// encrypt_mode-> cipher 내부에 있는 상수필드, 방법은 정해져있음, / 뒤에는 key값 넣기
			
			// 매개변수로 전달받은 문자열 암호화 처리
			byte[] encrpt = str.getBytes(Charset.forName("UTF-8")); //byte배열로 변환
			byte[] result = cipher.doFinal(encrpt);
			resultValue = Base64.getEncoder().encodeToString(result); //base64방식으로 문자열로 만들어줌
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		
		return resultValue;
	}
	
	// 생성된 키를 가지고 복호화 하는 메서드
	public static String decrypt(String encryptedStr) {
		
		String decryptedValue = "";
		
		try {
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, AESCryptor.key);
			//여기까지 초기화 끝, 이제 역순으로 해줘야함
			
			byte[] decodeStr = Base64.getDecoder().decode(encryptedStr.getBytes(Charset.forName("UTF-8")));
			byte[] orignStr = cipher.doFinal(decodeStr); //원본 byte배열로 만들어주기
			
			decryptedValue = new String(orignStr); //바이트 배열을 문자열로 변경해줌
			
		} catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
	
		
		
		
		return decryptedValue;
		
	}
	
	
	
	
	
}