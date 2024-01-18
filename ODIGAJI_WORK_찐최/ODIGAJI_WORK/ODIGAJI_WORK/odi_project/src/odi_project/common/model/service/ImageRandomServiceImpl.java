package odi_project.common.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import odi_project.common.model.dao.RandomDAO;
import odi_project.common.model.vo.Image;
import odi_project.common.template.Template;

public class ImageRandomServiceImpl implements ImageRandomService {
    private RandomDAO randomDAO = new RandomDAO();

    @Override
    public List<Image> ImageRandomAddress() {
        SqlSession sqlSession = Template.getSqlSession();

        // 이미지 주소
        List<Image> imageRandomAddress = randomDAO.getRandomImages(sqlSession);

        // 사용한 sqlSession 반납
        sqlSession.close();
        return imageRandomAddress;
    }
}
