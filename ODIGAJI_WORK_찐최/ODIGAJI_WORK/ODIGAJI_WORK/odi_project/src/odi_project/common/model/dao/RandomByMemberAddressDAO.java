package odi_project.common.model.dao;

import java.util.HashMap;
import java.util.Map;

//import org.apache.ibatis.session.SqlSession;



import org.apache.ibatis.session.SqlSession;

import odi_project.common.model.vo.Image;


public class RandomByMemberAddressDAO {

    public static Image getRandomByMemberAddressDAO(SqlSession sqlSession, String memberAddress) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("memberAddress", memberAddress);
        
        Image result = sqlSession.selectOne("ImageMapper.getRandomImagesByMemberAddress", parameters);
        if (result == null) {
           System.out.println("getRandomImagesByMemberAddress: null");
        }
        return result;
    }
}


//public class RandomByMemberAddressDAO {
//    private final SqlSession sqlSession;
//
//    public RandomByMemberAddressDAO(SqlSession sqlSession) {
//        this.sqlSession = sqlSession;
//    }
//
//    public String getRandomImagesByMemberAddress() {
//        return sqlSession.selectOne("ImageMapper.getRandomImagesByMemberAddress");
//    }
//
//	public String getRandomImageByMemberAddress(String memberAddress) {
//		// member 주소를 매개변수로 받아왔다
//		return sqlSession.selectOne("ImageMapper.getRandomImageByMemberAddress", memberAddress);
//	}
//}	