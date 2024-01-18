package odi_project.common.model.dao;

//import org.apache.ibatis.session.SqlSession;

import odi_project.common.model.vo.Image;

import java.util.List;

import org.apache.ibatis.session.SqlSession;



public class RandomDAO {

    public static List<Image> getRandomImages(SqlSession sqlSession) {
        List<Image> result = sqlSession.selectList("ImageMapper.getRandomImages");
        if (result == null) {
            System.out.println("getRandomImages: null");
        }
        return result;
    }
}



//public class RandomDAO {
//    private final SqlSession sqlSession;
//
//    public RandomDAO(SqlSession sqlSession) {
//        this.sqlSession = sqlSession;
//    }
//
//    public List<Image> getRandomImages() {
//        return sqlSession.selectList("ImageMapper.getRandomImages");
//    }
//}