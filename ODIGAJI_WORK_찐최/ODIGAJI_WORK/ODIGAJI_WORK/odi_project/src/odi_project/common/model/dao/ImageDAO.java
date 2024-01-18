package odi_project.common.model.dao;

//import org.apache.ibatis.session.SqlSession;

import odi_project.common.model.vo.Image;


import java.util.List;

import org.apache.ibatis.session.SqlSession;



public class ImageDAO {

    public static List<Image> getImages(SqlSession sqlSession) {
        List<Image> result = sqlSession.selectList("ImageMapper.getTopRankedImages");
        if (result == null) {
            System.out.println("getTopRankedImages: null");
        }
        return result;
    }
}







//public class ImageDAO {
//    private SqlSession sqlSession;
//
//    public ImageDAO(SqlSession sqlSession) {
//        this.sqlSession = sqlSession;
//    }
//
//    public List<Image> getTopImages() {
//        return sqlSession.selectList("ImageMapper.getTopRankedImages");
//    }
//    
//}
