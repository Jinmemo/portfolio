package odi_project.common.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import odi_project.common.model.dao.ImageDAO;
import odi_project.common.model.vo.Image;
import odi_project.common.template.Template;

public class ImageServiceImpl implements ImageService{
	
	private ImageDAO imageDAO= new ImageDAO();

	@Override
	public List<Image> ImageAddress() {
		SqlSession sqlSession=Template.getSqlSession();
		
		//이미지 주소
		List<Image> imageAddress=imageDAO.getImages(sqlSession);
		
		//사용한 sqlSession 반납
		sqlSession.close();
		return imageAddress;
	}

	
}
